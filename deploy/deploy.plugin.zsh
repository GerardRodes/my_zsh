deploy(){
        if [[ $1 == '-g' ]]; then
                ssh root@$2.nubiq.net "cd /var/www/$2/ && git pull && ./generate.py clean && ./generate.py"
        else
                ssh root@$1.nubiq.net "cd /var/www/$1/ && git pull"
        fi
}
