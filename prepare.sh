tag=$1
prevtag="$(($1 - 1))"

docker build --no-cache -t ibccrm .
docker tag ibccrm ibccrm.ru/staskjs/ibccrm:$tag
docker push ibccrm.ru/staskjs/ibccrm:$tag