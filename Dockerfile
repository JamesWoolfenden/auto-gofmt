FROM golang:1.24-alpine

ENV GOPROXY=https://proxy.golang.org,direct
ENV GOSUMDB=sum.golang.org

# TODO: do we need all of these?
RUN apk --no-cache add bash git git-lfs &&\
    go install mvdan.cc/gofumpt@v0.9.2

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]