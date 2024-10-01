#!/bin/bash

# dotenvファイルの読み込み
eval "$(cat .env <(echo) <(declare -x))"

# sftpでサーバーからデータを取得
cd daily
DATE=$(date -d '1 days ago' '+%Y-%m-%d')
expect -c "spawn sftp ${SFTP_USER}@${SFTP_HOST}
expect \"password: \"
send \"${SFTP_PASSWORD}\"
expect \"sftp> \"
send \"get ${SFTP_BASEPATH}/${DATE}.csv\r\"
expect \"sftp> \"
send \"quit\r\"
"

# shift-jisのcsvをutf-8に変換
cd ..
deno run -A conv-charset.ts --path="daily/${DATE}.csv" --from=shift-jis

# commitしてpush
git add -A
git commit -m "🤖 update data"
git push