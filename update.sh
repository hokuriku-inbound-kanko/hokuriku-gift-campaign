#!/bin/bash

#################### variables ####################
#shellcheck disable=SC2034
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
MAGENTA='\033[35m'
CYAN='\033[36m'
WHITE='\033[37m'
GRAY='\033[38;5;244m'
RESET='\033[0m'

#################### main ####################
echo -e "${CYAN}auto update hokuriku-gift-campain data${RESET}"

# read dotenv
eval "$(cat .env <(echo) <(declare -x))"

# get data with sftp
cd daily
DATE=$(date -d '1 days ago' '+%Y-%m-%d')
echo -e "${CYAN}get $DATE.csv${RESET}"
expect -d -c "
spawn sftp ${SFTP_USER}@${SFTP_HOST}
expect \"${SFTP_USER}@${SFTP_HOST}'s password:\"
send \"${SFTP_PASSWORD}\r\"
expect \"sftp>\"
send \"get ${SFTP_BASEPATH}/${DATE}.csv\r\"
expect \"sftp>\"
send \"quit\r\"
"

# convert shift-jis to utf-8
echo -e "${CYAN}convert data charset${RESET}"
cd ..
deno run -A conv-charset.ts --path="daily/${DATE}.csv" --from=shift-jis
if [ $? -ne 0 ]; then
  echo -e "${RED}ERROR:${RESET} convert data failed"
  exit 1
fi

# commit & push
echo -e "${CYAN}upload to github${RESET}"
git add -A
git commit -m "🤖 update data"
git push
