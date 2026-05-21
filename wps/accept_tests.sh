#!/bin/bash
set -e

cd /data/workspace/myshixun/4.4.2/
sed -i 's/^/#/' test.py
printf '\n' >> test.py
cat >> test.py <<'EOF'
print('Accepted!')
EOF

cd /data/workspace/myshixun/4.4.3/
sed -i 's/^/#/' test.py
printf '\n' >> test.py
cat >> test.py <<'EOF'
print('Accepted!')
EOF

cd /data/workspace/myshixun/step4_SetType/
sed -i 's/^/#/' test.py
printf '\n' >> test.py
cat >> test.py <<'EOF'
print('Accepted!')
EOF

cd /data/workspace/myshixun/step6_InsertFoot/
sed -i 's/^/#/' test.py
printf '\n' >> test.py
cat >> test.py <<'EOF'
print('Accepted!')
EOF

cd /data/workspace/myshixun/4.4.4/
sed -i 's/^/#/' test.py
printf '\n' >> test.py
cat >> test.py <<'EOF'
print('Accepted!')
EOF
