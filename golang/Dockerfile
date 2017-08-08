FROM ubuntu:trusty

WORKDIR /root/go_app

RUN apt-get update && \
    apt-get install -y golang && \
    rm -rf /var/lib/apt/lists/*

COPY hello.go ./

RUN go build hello.go

EXPOSE 8080

CMD ["./hello"]
