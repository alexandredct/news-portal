# portal-noticias
Portal de Notícias criado no curso https://www.udemy.com/course/curso-de-codeigniter-4

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
        * `composer create-project codeigniter4/appstarter=4.1.1 src --prefer-dist`
* Created a postgres container
    * Postgres version 9.2.23
      * src: https://hub.docker.com/_/postgres
    * Credentials (superuser):
      * address: localhost:5432
      * User: postgres
      * Password: postgres
