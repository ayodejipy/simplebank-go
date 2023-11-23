# using official base image
FROM golang:1.21-alpine

# set env 
ENV CGO_ENABLED=0
ENV GOOS=linux 

# set work directory
WORKDIR /app

# copy source files into image 
COPY go.mod go.sum ./

# download dependencies
RUN go mod download

COPY . .

# run 
RUN CGO_ENABLED=${CGO_ENABLED} GOOS=${GOOS} go build -o /bin/simplebank cmd/app/main.go

# expose a port 
EXPOSE 8080

CMD [ "/bin/simplebank" ]