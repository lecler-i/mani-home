[![Build Status](https://travis-ci.com/lecler-i/mani-home.svg?token=g6epgtUqZ1QoxxxJ3knd&branch=master)](https://travis-ci.com/lecler-i/mani-home)
[![codecov](https://codecov.io/gh/lecler-i/mani-home/branch/master/graph/badge.svg?token=SuVsTcWWWf)](https://codecov.io/gh/lecler-i/mani-home)

# Mani-Home

## Installation
This app run under elixir, phoenix, postgresql and react.js. 

## PostgreSQL

### first install
- install postgresql on your machine, example on Arch Linux
```
pacman -S postgresql
```
- change password of `postgres` user by typing:
```
sudo passwd postgres

```
-switch to postgres user by:
```
sudo -u postgres -i
```
- initialialise db cluster:
```
initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'
```
- exit
```
exit
```
- launch postgres.service as root, example with systemd based system:
```
sudo systemctl start postgresql.service
```

## Phoenix
- Installation in local directories
```
mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
```
- If you're on Linux system, you should install inotify-tools. On Arch Linux:
```
pacman -S inotify-tools
```

## install Dependencies
```
mix deps.get # elixir and phoenix dependencies
npm install && node node_modules/brunch/bin/brunch build
```

## create database that gonna be used
Log in postgres user and performed this cmdline:
```
createdb MyDataBaseName
```

the default for dev environment is `manihome_dev`

## config server
edit the file in `./config/dev.exs` (and other if you need it) to work with your environment (hostname, postgres passwrd, etc..)

NB: you can find your hostname in `/etc/hosts` or just write `127.0.0.1`

## Launch server

For launch server: `mix phoenix.server`
For launch server in iex `iexs -S mix phoenix.server`

Then :  
- go to http://localhost:4000 to see athe app. 
