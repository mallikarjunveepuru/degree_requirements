# To get this rolling:

First clone the repo:

``` bash
$ git clone https://github.com/rickpr/degree_requirements
```

Install the bundle:
``` bash
$ cd degree_requirements
$ bundle
```

Configure the environment by creating a `.env` file:

``` bash
CASSANDRA_HOST='localhost'
CASSANDRA_PORT=9042
CASSANDRA_KEYSPACE='degree_requirements'
CASSANDRA_USER='yourself'
CASSANDRA_PASSWORD='supersecret'
```

Create and the keyspace and migrate the schema:
``` bash
$ rake cequel:keyspace:create
$ rake cequel:migrate
```

Seed the initial data into the database:
``` bash
$ rake cequel:seed
```

Start the server:
``` bash
$ gem install foreman
$ foreman start
```
