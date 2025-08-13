import json

with open('wallets.json') as f:
    wallets = json.load(f)  

group1 = [w['address'] for w in wallets[0:20]]    # 1-20（20个）
group2 = [w['address'] for w in wallets[20:60]]   # 21-60（40个）
group3 = [w['address'] for w in wallets[60:300]]  # 61-300（240个）

with open('addresses_1-20.txt', 'w') as f:
    f.write('\n'.join(group1) + ('\n' if group1 else ''))  

with open('addresses_21-60.txt', 'w') as f:
    f.write('\n'.join(group2) + ('\n' if group2 else ''))

with open('addresses_61-300.txt', 'w') as f:
    f.write('\n'.join(group3) + ('\n' if group3 else ''))

print(f"✅ 生成完成（严格验证）：")
print(f"1-20:   {len(group1)}个（应有：20）")
print(f"21-60:  {len(group2)}个（应有：40）")
print(f"61-300: {len(group3)}个（应有：240）")
print(f"总数据量检查：{len(wallets)}（必须≥300）")

import os
print("\n🔥 文件实际行数验证：")
os.system('wc -l addresses_*.txt')
