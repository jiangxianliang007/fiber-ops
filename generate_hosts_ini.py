import json

def generate_inventory(input_file, output_file, wallets_file):
    with open(wallets_file, 'r') as f:
        wallets = json.load(f)

    privkey_iter = iter(wallet['privkey'] for wallet in wallets)

    with open(input_file, 'r') as f:
        lines = [line.strip() for line in f.readlines() if line.strip()]

    sections = {
        'core': lines.index('[Core]'),
        'secondary': lines.index('[Secondary]'),
        'edge': lines.index('[Edge]'),
        'children': lines.index('[fiber_test:children]')
    }

    with open(output_file, 'w') as f:
        # 写入Core节点
        f.write('[Core]\n')
        for node in lines[sections['core']+1:sections['secondary']]:
            if not node or node.startswith('['):
                continue
            process_node(node, f, privkey_iter, 2, node_type='core')

        # 写入Secondary节点
        f.write('\n[Secondary]\n')
        for node in lines[sections['secondary']+1:sections['edge']]:
            if not node or node.startswith('['):
                continue
            process_node(node, f, privkey_iter, 4, node_type='secondary')

        # 写入Edge节点
        f.write('\n[Edge]\n')
        for node in lines[sections['edge']+1:sections['children']]:
            if not node or node.startswith('['):
                continue
            process_node(node, f, privkey_iter, 20, node_type='edge')

        # 写入children
        f.write('\n[fiber_test:children]\n')
        f.write('Core\nSecondary\nEdge\n')

def process_node(node, output_file, privkey_iter, replica_count, node_type):
    """处理单个节点并生成副本"""
    parts = node.split()
    node_name = parts[0]
    original_vars = ' '.join(parts[1:])

    p2p_port = 8120
    rpc_port = 8220
    metrics_port = 8121

    for i in range(1, replica_count + 1):
        try:
            privkey = next(privkey_iter)
        except StopIteration:
            raise ValueError("钱包中的私钥数量不足")

        # 根据节点类型和编号设置 loglevel
        if node_type in ['core', 'secondary']:
            loglevel = 'debug'
        elif node_type == 'edge':
            loglevel = 'debug' if i <= 10 else 'info'

        new_node = (
            f"{node_name}-{i} {original_vars} "
            f"p2p_port={p2p_port} rpc_port={rpc_port} metrics_port={metrics_port} "
            f"fiber_dir=/home/ubuntu/fiber{i} "
            f"ckb_key={privkey} loglevel={loglevel}\n"
        )
        output_file.write(new_node)
        p2p_port += 2
        rpc_port += 2
        metrics_port += 2

if __name__ == '__main__':
    input_file = 'terraform/inventory.ini'
    output_file = 'ansible/inventory/hosts.ini'
    wallets_file = 'ckb-wallets/wallets.json'

    try:
        generate_inventory(input_file, output_file, wallets_file)
        print(f"生成的inventory文件已保存至 {output_file}")

        # 验证生成的文件
        with open(output_file, 'r') as f:
            for line_num, line in enumerate(f, 1):
                line = line.strip()
                if line and not line.startswith('[') and not line.startswith('#'):
                    parts = line.split()
                    if len(parts) < 2 or '=' in parts[0]:
                        print(f"警告: 第 {line_num} 行可能格式不正确: {line}")

    except ValueError as e:
        print(f"错误: {e}")
    except FileNotFoundError as e:
        print(f"错误: 文件未找到 - {e}")
    except Exception as e:
        print(f"意外错误: {str(e)}")
