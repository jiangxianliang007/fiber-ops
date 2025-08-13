import re
from pathlib import Path

def extract_nodes(input_text):
    pattern = r'ansible_host=([\d.]+).*?rpc_port=(\d+)'
    matches = re.findall(pattern, input_text)
    return matches

def write_output(filename, nodes):
    with open(filename, 'w') as f:
        f.write("fibers_urls = [\n")
        for ip, port in nodes:
            f.write(f'    "http://{ip}:{port}",\n')
        f.write("]\n")

def process_file(input_file):
    try:
        with open(input_file, 'r') as f:
            content = f.read()
        
        nodes = extract_nodes(content)
        
        if not nodes:
            print("Error: No valid node data found in the file")
            return
        
        core_nodes = nodes[:20]
        secondary_nodes = nodes[20:60]
        edge_nodes = nodes[60:300]
        
        write_output('core.txt', core_nodes)
        write_output('secondary.txt', secondary_nodes)
        write_output('edge.txt', edge_nodes)
        
        print(f"Processing complete:\n"
              f"- {len(core_nodes)} core nodes written to core.txt\n"
              f"- {len(secondary_nodes)} secondary nodes written to secondary.txt\n"
              f"- {len(edge_nodes)} edge nodes written to edge.txt")
    
    except Exception as e:
        print(f"Error processing file: {e}")

if __name__ == "__main__":
    input_file = 'hosts.ini'
    
    if Path(input_file).exists():
        process_file(input_file)
    else:
        print(f"Error: File '{input_file}' not found in current directory")
