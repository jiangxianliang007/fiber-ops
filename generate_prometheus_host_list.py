#!/usr/bin/env python3
import configparser
import io

inventory_file = 'terraform/inventory.ini'

with open(inventory_file, 'r') as f:
    inventory_content = f.read()

# 转换为 ConfigParser 可以处理的格式
fake_section = '[DEFAULT]\n' + inventory_content
fake_file = io.StringIO(fake_section)

config = configparser.ConfigParser(allow_no_value=True)
config.read_file(fake_file)

# 提取节点名称和IP
nodes = []
for line in inventory_content.split('\n'):
    line = line.strip()
    if line and not line.startswith('['):
        parts = line.split()
        node_name = parts[0]
        ip = None
        for part in parts[1:]:
            if part.startswith('ansible_host='):
                ip = part.split('=')[1]
                break
        if ip:
            nodes.append((node_name, ip))

# 生成 Prometheus 配置
prometheus_config = """scrape_configs:
  - job_name: 'fiber_nodes'
    static_configs:
      - targets:
          # Fiber nodes\n"""

for node_name, ip in nodes:
    prometheus_config += f"          # {node_name}\n"
    prometheus_config += f"        - {ip}:8229\n"

prometheus_config += """    metrics_path: '/metrics'
    scheme: 'http'
"""

print(prometheus_config)
