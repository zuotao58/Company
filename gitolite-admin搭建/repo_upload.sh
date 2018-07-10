set -x

pwd=${PWD}
#入库代码目录
QCOM=/data/QcomBaseBackup/QcomBase

attrget()  
{
        ATTR_PAIR=${1#*$2=\"}
        echo "${ATTR_PAIR%%\"*}" 
}

parse_manifest()  
{
        local IFS=\>

        while read -d \< ENTITY CONTENT  
        do
                TAG_NAME=${ENTITY%% *}
                ATTRIBUTES=${ENTITY#* }
                if [[ $TAG_NAME == "project" ]];then
                        CLIENT_PATH=`attrget ${ATTRIBUTES} "path"`
                        SERVER_PATH=`attrget ${ATTRIBUTES} "name"`
                        if [ $SERVER_PATH == "" ];then
                                echo 
                        else
                                if [ $CLIENT_PATH == "name=" ];then
                                        CLIENT_PATH=$SERVER_PATH
                                fi
                        fi
                        repo_pro $SERVER_PATH $CLIENT_PATH
                fi
        done < $1
}

repo_pro() {
        REMOTE_PATH=$1
        LOCAL_PATH=$2
        workdir=$pwd/${REMOTE_PATH##*/}
        echo $workdir
        git clone gerritroot@192.168.31.242:qcom/$REMOTE_PATH
        cd $workdir
        git checkout -b master
        rm -rf !\(.git\)
        cp -rf $QCOM/$CLIENT_PATH/* $workdir
        find . -name .gitignore | xargs rm -rfv
        git add -A
        git commit --allow-empty -m "Initial commit update"
        git push --set-upstream origin master
        cd $pwd
                rm -rf $workdir
}

parse_manifest $1

                                                                                                                                                                                                 7,0-1         Top
#解析xml 将SERVER_PATH CLIENT_PATH 解析并赋值
#git clone SERVER_PATH 创建空仓库
#如果有这个仓库，删除代码，除了.git
#将需要上传的代码拷贝到当前目录 push
