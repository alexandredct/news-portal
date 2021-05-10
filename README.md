# news-portal
News Portal created during the course https://www.udemy.com/course/curso-de-codeigniter-4

# Important
At the first start, run the command below to create a .env file and change it to de respective environment
* For development: `cp -p env .env && sed -i 's/# CI_ENVIRONMENT = production/CI_ENVIRONMENT = development/g' .env`
* For testing: `cp -p env .env && sed -i 's/# CI_ENVIRONMENT = production/CI_ENVIRONMENT = testing/g' .env`
* For production: `cp -p env .env && sed -i 's/# CI_ENVIRONMENT/CI_ENVIRONMENT/g' .env`



## change Log

### Version 1.0.0  
Release date: 2021-05-08

#### Features
* Created a webserver container
    * PHP 7.4.19
      * src: https://hub.docker.com/_/php
    * Composer 2.0.13
      *  src: https://hub.docker.com/_/composer
    * Address: http://localhost:8080
    * CodeIgniter 4.1.1
        * Installation: `composer create-project codeigniter4/appstarter=4.1.1 src --prefer-dist`
* Created a postgres container
    * Postgres version 9.2.23
      * src: https://hub.docker.com/_/postgres
    * Credentials (superuser):
      * address: localhost:5432
      * User: postgres
      * Password: postgres
