FROM gradle:4.0-jdk8

ENV ANDROID_HOME /home/gradle/android-sdk

USER root

RUN apt-get update && apt-get install -y wget lib32stdc++6 lib32z1 \
	&& mkdir -p ${ANDROID_HOME} && cd ${ANDROID_HOME} && wget https://dl.google.com/android/repository/tools_r25.2.3-linux.zip \
	&& unzip tools_r25.2.3-linux.zip \
	&& echo y | ${ANDROID_HOME}/tools/bin/./sdkmanager "platform-tools" \
	&& echo y | ${ANDROID_HOME}/tools/bin/./sdkmanager "extras;android;m2repository" \
	&& echo y | ${ANDROID_HOME}/tools/bin/./sdkmanager "extras;google;m2repository" \
	&& echo y | ${ANDROID_HOME}/tools/bin/./sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2" \
	&& echo y | ${ANDROID_HOME}/tools/bin/./sdkmanager "platforms;android-26" \
	&& echo y | ${ANDROID_HOME}/tools/bin/./sdkmanager "build-tools;26.0.1" \
	&& echo y | ${ANDROID_HOME}/tools/bin/./sdkmanager "platforms;android-25" \
	&& echo y | ${ANDROID_HOME}/tools/bin/./sdkmanager "build-tools;25.0.2"
