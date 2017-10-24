# Todo

## Setup

1. Install nanobox client https://docs.nanobox.io/install/
1. Run `nanobox dns add local todo.dev` to add the hostname of the virtual machine to your `/etc/hosts` file.
1. Run `nanobox run` to get a command prompt on the virtual machine.
1. Within the VM, run the following: `mix do ecto.create, ecto.migrate`

## Running locally

1. `nanobox run` to get a command prompt in the virtual machine.
1. `mix phx.server` to start up the server.

You should be able to react the server at http://todo.dev

### Example CURLs

* List all
  ```bash
  $ curl -XGET http://todo.dev:4000/api/todos

  {"data":[]}
  ```
* Create
  ```bash
  $ curl -XPOST -H 'Content-Type: application/json' http://todo.dev:4000/api/todos -d '{"todo":{"title":"Buy Milk","description":"Organic grass fed"}}'

  {"data":{"updatedAt":"2017-10-24T01:31:31.676619","title":"Buy Milk","id":2,"description":"Organic grass fed","createdAt":"2017-10-24T01:31:31.676585","completed":false}}
  ```
* Update
  ```bash
  $ curl -XPUT -H 'Content-Type: application/json' http://todo.dev:4000/api/todos/2 -d '{"todo":{"completed": true}}'

  {"data":{"updatedAt":"2017-10-24T01:33:08.909346","title":"Buy Milk","id":2,"description":"Organic grass fed","createdAt":"2017-10-24T01:31:31.676585","completed":true}}
  ```
* Show
  ```bash
  $ curl -XGET http://todo.dev:4000/api/todos/2

  {"data":{"updatedAt":"2017-10-24T01:33:08.909346","title":"Buy Milk","id":2,"description":"Organic grass fed","createdAt":"2017-10-24T01:31:31.676585","completed":true}}
  ```
* Delete (No response body, so `-v` is used to see the HTTP response headers of 204)
  ```bash
  $ curl -XDELETE http://todo.dev:4000/api/todos/1 -v
  *   Trying 172.20.0.5...
  * TCP_NODELAY set
  * Connected to todo.dev (172.20.0.5) port 4000 (#0)
  > DELETE /api/todos/1 HTTP/1.1
  > Host: todo.dev:4000
  > User-Agent: curl/7.54.0
  > Accept: */*
  >
  < HTTP/1.1 204 No Content
  < server: Cowboy
  < date: Tue, 24 Oct 2017 01:36:27 GMT
  < content-length: 0
  < cache-control: max-age=0, private, must-revalidate
  < x-request-id: o5gdi9t0ruga7tdm4i802h3m89ge3dmi
  <
  * Connection #0 to host todo.dev left intact
  ```