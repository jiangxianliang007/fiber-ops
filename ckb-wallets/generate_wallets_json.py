import json

def parse_wallets(file_path):
    wallets = []

    with open(file_path, 'r', encoding='utf-8') as f:
        for i, line in enumerate(f):
            line = line.strip()
            if not line or ',' not in line:
                continue
            try:
                address, privkey = map(str.strip, line.split(',', 1))
                # Remove '0x' prefix if present in private key
                if privkey.startswith('0x'):
                    privkey = privkey[2:]
                wallet = {
                    'id': f'{i + 1}',
                    'address': address,
                    'privkey': privkey
                }
                wallets.append(wallet)
            except Exception as e:
                print(f"Error parsing line {i + 1}: {line}")
                print(e)

    return wallets

if __name__ == '__main__':
    input_file = 'wallets.txt'
    output_file = 'wallets.json'

    wallets = parse_wallets(input_file)

    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(wallets, f, indent=2, ensure_ascii=False)

    print(f"✅ 已成功将 {len(wallets)} 个钱包保存到 {output_file}")
