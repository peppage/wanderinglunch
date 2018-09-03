# These are the values we want to pass for VERSION and BUILD
VERSION=`git describe --tags`
BUILD=`date +%FT%T%z`

# Setup the -ldflags option for go build here, interpolate the variable values
LDFLAGS=-ldflags "-w -s -X main.Version=${VERSION} -X main.Build=${BUILD}"

default: build

build: vet
	go build -v

release: clean vet
	go build ${LDFLAGS} -v

linux: clean vet
	GOOS=linux GOARCH=amd64 go build ${LDFLAGS} -v

vet:
	go vet $(go list ./... | grep -v /vendor/)


clean:
	go clean

run: clean build
	./wanderinglunch