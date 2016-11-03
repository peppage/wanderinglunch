# https://gist.github.com/Stratus3D/a5be23866810735d7413

# These are the values we want to pass for VERSION and BUILD
# git tag 1.0.1
# git commit -am "One more change after the tags"
VERSION=`git describe --tags`
BUILD=`date +%FT%T%z`

# Setup the -ldflags option for go build here, interpolate the variable values
LDFLAGS=-ldflags "-w -s -X main.Version=${VERSION} -X main.Build=${BUILD}"

default: build

build: vet templates assets
	go build -v

release: clean vet templates assets
	go build ${LDFLAGS} -v

linux: clean vet templates assets
	GOOS=linux GOARCH=amd64 go build ${LDFLAGS} -v

vet:
	go vet $(go list ./... | grep -v /vendor/)

templates:
	gorazor ./view ./view
	qtc -dir ./view

assets:
	sfbt
	go generate

# https://github.com/golang/lint
# go get github.com/golang/lint/golint
lint:
	golint .

glide:
	glide install

clean:
	find ./view/ -type f -name "*.go" -delete 
	go clean

run: clean build
	./wanderinglunch