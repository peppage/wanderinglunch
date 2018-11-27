[![Trello](https://img.shields.io/badge/trello-outdated-red.svg)](https://trello.com/b/Cf8c0Z8e/wandering-lunch)
<div align="center">
    <br>
  <img
    alt="Wanderinglunch Logo"
    src="https://wanderinglunch.com/static/images/wl.png"
  />
  <br>
</div>

Welcome to the [Wanderinglunch](https://wanderinglunch.com) codebase. It's a website that tracks foodtrucks around NYC basd on their tweets!

# Lazy Server Setup
You can pretty much follow [this guide](https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers) to setup the server.

---

* The site needs a Postgres database to run.
* Feel free to add local trust to psql if you're lazy

1.  sudo vi /etc/postgresql/9.4/main/pg_hba.conf
	* `host all all 127.0.0.1/32 trust`

## Add user to databse
1. su postgres
1. createuser USERNAME

---

* All Secrets are stored in a config file next to the exe for ease.
* I cross compile the site on windows and drop the exe onto the server

## License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. Please see the [LICENSE](./LICENSE.md) file in our repository for the full text.
