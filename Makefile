all: publish

app:
	echo "Building app"
	test -d /tmp/gradlecache || mkdir /tmp/gradlecache
	podman run -it -v $(shell pwd):/project -v /tmp/gradlecache:"/root/.gradle" mingc/android-build-box bash -c 'cd /project; ./gradlew build'

publish: app
	rm -fr /var/lib/fdroid/unsigned/*
	find . -name *.apk
