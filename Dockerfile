FROM golang:1.25-alpine@sha256:5caaf1cca9dc351e13deafbc3879fd4754801acba8653fa9540cea125d01a71f

ENV GOPROXY=https://proxy.golang.org,direct
ENV GOSUMDB=sum.golang.org

# bash: required for entrypoint.sh
# git: required for all git operations
# git-lfs: optional but recommended for repos with LFS-tracked files
RUN apk --no-cache add bash git git-lfs &&\
    go install mvdan.cc/gofumpt@v0.9.2

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]