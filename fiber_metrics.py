# parse_inventory_to_sd_file.py

import yaml
import sys
import os

def generate_prometheus_sd_config(file_path):
    """
    解析 Ansible inventory 文件以生成 Prometheus file_sd 格式的配置文件。
    """
    target_groups = []
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if line.startswith('#') or not line or line.startswith('['):
                    continue

                parts = line.split()
                if not parts:
                    continue

                instance_name = parts[0]
                host_vars = {}
                for part in parts[1:]:
                    if '=' in part:
                        key, value = part.split('=', 1)
                        host_vars[key] = value

                if 'ansible_host' in host_vars and 'metrics_port' in host_vars:
                    target = f"{host_vars['ansible_host']}:{host_vars['metrics_port']}"
                    # 每一个节点都是一个独立的 target group
                    config_entry = {
                        'targets': [target],
                        'labels': {
                            'instance': instance_name
                        }
                    }
                    target_groups.append(config_entry)

    except FileNotFoundError:
        print(f"错误: 文件 '{file_path}' 未找到。", file=sys.stderr)
        return None
    except Exception as e:
        print(f"解析文件时发生错误: {e}", file=sys.stderr)
        return None

    # 直接返回 target_groups 列表
    return yaml.dump(target_groups, default_flow_style=False, indent=2, allow_unicode=True)

if __name__ == "__main__":
    inventory_file_path = "ansible/inventory/hosts.ini"
    # 输出一个专门用于 file_sd 的文件
    output_file_path = "fiber_nodes.yml"

    if not os.path.exists(inventory_file_path):
        print(f"错误: 请确保 '{inventory_file_path}' 文件存在。")
        sys.exit(1)

    print(f"--- 正在从 '{inventory_file_path}' 读取配置 ---")

    prometheus_yaml = generate_prometheus_sd_config(inventory_file_path)

    if prometheus_yaml:
        try:
            with open(output_file_path, 'w', encoding='utf-8') as f:
                f.write(prometheus_yaml)
            print(f"✅ Prometheus 服务发现文件已成功生成: '{output_file_path}'")
        except IOError as e:
            print(f"❌ 写入文件时出错: {e}", file=sys.stderr)
            