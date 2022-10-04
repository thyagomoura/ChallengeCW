# Backend challenge - Player Transfermarkt

### Application versions
```bash
** NodeJs - v12.22.9
** Yarn - 1.22.19
** Ruby - 3.0.2
** Ruby on rails - 7.0.4
** Docker version - 20.10.18
** docker-compose - 1.26.0
** Bundler - 2.3.22
```
#### Gem versions

```bash
* gem 'pg', '~> 1.4', '>= 1.4.3'
* gem 'jwt', '~> 2.5'
* gem 'rack-etag', '~> 3.0'
* gem 'faker', '~> 2.23'
* gem 'rspec-rails', '~> 6.0.0.rc1'
```

## Application summary

The application created has as a simulation a player transfermarkt, so a manager has players on his team as well as the transfermarkt has players available for transfer, so the manager needs to make a request to the player passing parameters and authentication that allow him to acquire the player of your interest, once acquired, the player receives a contract, in the same way, if the manager wants to place a player in the transfermarkt, it is necessary to pass parameters and authentication for a request to the player, so the player will be updated to the transfermarkt.

### Commit messages
```bash
Commit title
[CHANGE - LOCATION]
+ added
- withdrawn
* adjusted
```

### Container and database

* Docker was used to build the application container, thus making it possible to package application or environment within a container, making it portable to any other host that contains Docker and set with docker-compose installed.

* The database used was postgresql where there is a docker container for it and another just for the application, to populate the database the Faker gem was used to populate it as a database column and allow simulating.

### Authentication and cache

* Authentication is done through a JWT token, which needs to be passed to any request made to a player, thus allowing players' transitions between coaches and the transfer window to be secure, this token is a bearer type passed in the request header. To receive this token it is necessary to make a request for the “auths” route, so this token has a validity of up to 45 seconds.

* To carry out the cache of the application, Etag was used, so if the request is not modified, the return of the request is carried out quickly, without losing the execution time.

### Tests

* Functional tests were performed through Rspec for all models, so the complete CRUD test is performed to identify possible bottlenecks during requests of this type.

## Running the project

To make this application work, it is necessary that the test machine has installed some packages responsible for its operation, for this it is necessary to install:

1. Nodejs
2. Yarn
3. Docker
4. Docker-compose

Once the packages above are installed, it is necessary to clone the project. To proceed, open your terminal in the folder where the project is and configure the container and application:

```
 machine@machine:~/ChallengeCW$ sudo docker build .
 machine@machine:~/ChallengeCW$ sudo docker-compose build
 machine@machine:~/ChallengeCW$ sudo docker-compose up
 machine@machine:~/ChallengeCW$ sudo docker-compose run web bundle
 machine@machine:~/ChallengeCW$ sudo docker-compose run web rake db:create
 machine@machine:~/ChallengeCW$ sudo docker-compose run web rake db:migrate
 machine@machine:~/ChallengeCW$ sudo docker-compose run web rake dev:setup
```
After the steps, the construction of the container was completed, the application is already running locally using a already population database, now the project is ready to be tested through requests.

