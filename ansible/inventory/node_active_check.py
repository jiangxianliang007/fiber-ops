import requests
import json
import time
import re
import sys
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed

def load_nodes_from_file(filename):
    """从文件中加载节点URL列表"""
    with open(filename, 'r') as f:
        content = f.read()
    # 提取所有URL
    urls = re.findall(r'"http://([^"]+)"', content)
    return [f"http://{url}" for url in urls]

def get_node_info(url):
    """调用node_info RPC接口"""
    headers = {'Content-Type': 'application/json'}
    payload = {
        "jsonrpc": "2.0",
        "method": "info_node_info",
        "params": [],
        "id": 1
    }
    
    try:
        start_time = time.time()
        response = requests.post(url, headers=headers, data=json.dumps(payload), timeout=5)
        latency = (time.time() - start_time) * 1000  # 计算延迟(ms)
        
        if response.status_code == 200:
            data = response.json()
            return {
                'url': url,
                'status': 'online',
                'latency': round(latency, 2),
                'result': data.get('result', {}),
                'error': None
            }
        else:
            return {
                'url': url,
                'status': 'error',
                'latency': None,
                'result': None,
                'error': f"HTTP {response.status_code}"
            }
    except Exception as e:
        return {
            'url': url,
            'status': 'offline',
            'latency': None,
            'result': None,
            'error': str(e)
        }

def check_all_nodes(file_list, output_file='node_status.json'):
    """检查所有节点状态"""
    all_nodes = {}
    total_nodes = 0
    
    with ThreadPoolExecutor(max_workers=50) as executor:
        for filename in file_list:
            try:
                urls = load_nodes_from_file(filename)
                print(f"Checking {len(urls)} nodes from {filename}...")
                total_nodes += len(urls)
                
                # 并发请求
                futures = {executor.submit(get_node_info, url): url for url in urls}
                for future in as_completed(futures):
                    result = future.result()
                    all_nodes[result['url']] = result
                    
            except Exception as e:
                print(f"Error processing {filename}: {str(e)}")
    
    # 保存结果
    with open(output_file, 'w') as f:
        json.dump(all_nodes, f, indent=2)
    
    # 打印统计信息
    online_nodes = sum(1 for node in all_nodes.values() if node['status'] == 'online')
    print(f"\nCheck completed: {online_nodes}/{total_nodes} nodes online")
    print(f"Results saved to {output_file}")

if __name__ == "__main__":
    # 要检查的文件列表
    files_to_check = ['core.txt', 'secondary.txt', 'edge.txt']
    
    # 检查文件是否存在
    missing_files = [f for f in files_to_check if not Path(f).exists()]
    if missing_files:
        print(f"Error: Missing files - {', '.join(missing_files)}")
        print("Please run the node extraction script first")
        sys.exit(1)
    
    check_all_nodes(files_to_check)
