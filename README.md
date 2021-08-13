<div align="center">
    <br>
  <img
    alt="Wanderinglunch Logo"
    src="https://wanderinglunch.com/images/wl.png"
  />
  <br>
</div>

[![Go Report Card](https://goreportcard.com/badge/github.com/peppage/wanderinglunch)](https://goreportcard.com/report/github.com/peppage/wanderinglunch)

Welcome to the [Wanderinglunch](https://wanderinglunch.com) code base. It's a website that tracks food trucks around NYC based on their tweets!

# Lazy Server Setup

You can pretty much follow [this guide](https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers) to setup the server.

---

- All Secrets are stored in a config.json file next to the exe for ease. Please see config.example.json for all the settings.
- I compile the site on WSL and drop the exe onto the server
  `GOOS=linux GOARCH=amd64 CGO_ENABLED=1 go build`
  
## Other version

I've written the site in a few different languages.

* [Node](https://github.com/peppage/wanderinglunch/tree/v1)
* [Go](https://github.com/peppage/wanderinglunch/tree/v5.0.3)
* [Dotnet](https://github.com/peppage/wanderinglunch/tree/v7.1.0)

## License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. Please see the [LICENSE](./LICENSE.md) file in our repository for the full text.
