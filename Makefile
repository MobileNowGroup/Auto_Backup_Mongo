build:
	docker build -t registry.cn-hangzhou.aliyuncs.com/mobilenow/mn_mongo_backup:${TAG} . && docker push registry.cn-hangzhou.aliyuncs.com/mobilenow/mn_mongo_backup:${TAG}
