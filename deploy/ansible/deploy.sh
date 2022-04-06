#!/bin/bash
# 実行ファイルのディレクトリ
EXECDIR=$( cd "$( dirname "$0" )" && pwd -P )

# post-commit のファイル群を引数でもらう
files=($@)


json='{"commit_files":['
for(( i=0; i<${#files[@]}; i++ )); do

    json+="\"${files[i]}\""

    if [ $i -lt $(( ${#files[@]} - 1 )) ]; then
        json+=","
    fi
done
json+=']}'

# echo $json

# ignore=$(cat deploy/ansible/ignore)

ignore='{"ignore_reg":"'
ignore+=$(cat deploy/ansible/ignore)
ignore+='"}'
# echo $ignore
ignore=$(echo $ignore | tr -d ' ')

# echo $ignore


docker run --rm -i \
    -v $EXECDIR:/ansible \
    -v ~/Key/:/Key/ \
    -v $EXECDIR/.ssh:/root/.ssh \
    -v $EXECDIR/../../:/app \
    --workdir /ansible \
    ansible:py3.10 \
        ansible-playbook -i /ansible/hosts /ansible/playbooks/deploy.yml \
        --extra-vars $json \
        --extra-vars $ignore
        # --extra-vars '{"ignore_files":["a", "b", "aaa*"]}' \
        # --extra-vars '{"reg":"(aaa*)"}'
        # --extra-vars '{"commit_files":["jfeif","feij"]}'
#         # --extra-vars "@/ansible/var.json"
