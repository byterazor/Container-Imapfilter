FROM alpine as builder

RUN apk update && apk add --no-cache git openssl openssl-dev make lua5.1 lua-dev pcre2 pcre2-dev alpine-sdk

WORKDIR /src

RUN git clone https://github.com/lefcha/imapfilter.git

RUN cd imapfilter; make all

FROM alpine
# 

# Ensure we have imapfilter dependencies
RUN apk update && apk add --no-cache tini bash ca-certificates openssl lua5.1 pcre2 

RUN mkdir -p /usr/local/share/imapfilter

COPY --from=builder /src/imapfilter/src/imapfilter /usr/local/bin/
COPY --from=builder /src/imapfilter/src/*.lua /usr/local/share/imapfilter/

# ensure every user can run imapfilter
RUN chmod a+x /usr/local/bin/imapfilter

ADD scripts/entryPoint.sh /entryPoint.sh

RUN chmod +x /entryPoint.sh

# add a user for running imapfilter in the container
RUN addgroup imapfilter 
RUN adduser -D -G imapfilter imapfilter
# ensure a homedirectory for the user exists and has correct access rights
RUN mkdir -p /home/imapfilter  
RUN chown imapfilter /home/imapfilter
RUN chgrp imapfilter /home/imapfilter

# run everything as the imapfilter user
USER imapfilter

ENTRYPOINT ["/sbin/tini", "--", "/entryPoint.sh"]