# https://gist.github.com/Stratus3D/a5be23866810735d7413
default: build

build: vet
	gorazor ./view ./view
	sfbt
	go build -v

vet:
	go vet $(go list ./... | grep -v /vendor/)

# https://github.com/golang/lint
# go get github.com/golang/lint/golint
lint:
	golint .

clean:
	find ./view/ -type f -name "*.go" -delete 
	go clean

run: clean build
	./wanderinglunch