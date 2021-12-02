FROM lsiobase/rdesktop-web:alpine


# Define working directory.
WORKDIR /tmp

RUN \
    # chromium.
 	echo "**** install chromium ****" \
	&& echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/main" >> /etc/apk/repositories \
    && apk upgrade -U -a \
    && apk add \
		libstdc++ \
		chromium \
		harfbuzz \
		nss \
		freetype \
		ttf-freefont \
		font-noto-emoji \
		wqy-zenhei \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000
VOLUME /config
