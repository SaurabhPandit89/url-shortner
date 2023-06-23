# URL Shortner

## Steps to Setup using Docker

* Install docker https://docs.docker.com/get-docker/
* Clone this repository
* CD into the project directory
* Run below command and wait for the command to finish.
  > `docker compose up -d`

* Access your app using http://localhost:3000 or http://0.0.0.0:3000


## Steps to Setup without Docker

* Make sure you have ruby 2.7.0 installed, if not please install
* Make sure you have MySQL server 8.0 or above is installed.
* Clone this repository
* CD into the project directory
* Run below commands
  > `bundle install`

  > `rails db:create`

  > `rails db:migrate`

* Set below env variables before starting rails server
  ```
  export set DB_HOST=127.0.0.1
  export set DB_USER=root
  export set DB_PASSWORD=Root@123
  ```
  > `rails s`

* Access your app using http://localhost:3000 or http://0.0.0.0:3000
