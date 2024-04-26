FROM golang:1.22.0

WORKDIR /app

COPY go.mod go.sum tracker.db ./

RUN go mod tidy 

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app

CMD ["/my_app"]