# Victoire demo (standard-project)

Welcome to the demo of [Victoire DCMS](https://github.com/Victoire/victoire) and thank you for your interest.
This is the best way to try Victoire and to discover all its features.
Please, follow the install instructions to start.

##Install

```
composer create-project victoire/demo myVictoire "1.3.*@dev"
```

###Set your parameters

You're invited to set up the parameters that will be defined in the "app/config/parameters.yml" file.
The default parameters are indicated between the () but you might need to insert different values regarding your environment.

###Domain names
Change domain names for yours in app/config/parameters.yml
```
    locale_pattern_table:
        demo.victoire.dev: fr
        demo.victoire.io: fr
```

###Database
Create your database
```
php bin/console doctrine:database:create
```
And import the demo database with var/dump/db.sql

Then generate the view cache with the following command
```
php bin/console victoire:generate:view-cache
```

Then generate widgets css for each view
```
php bin/console victoire:widget-css:generate
```

###Uploads
Extract demo uploads in web folder
```
tar -zxvf var/dump/uploads.tar.gz -C web/
```

###Bower
If you have not already installed bower, run the following command
```
npm install -g bower
```

Install Bower packages
```
bower install
```

###Assets
If you have not already installed less, run the following command
```
npm install -g less
```

Then dump assets
```
php bin/console assets:install web --symlink
php bin/console mopa:bootstrap:symlink:less
php bin/console assetic:dump
```

###Login page
Setup your virtualhost as usual and go to http://demo.victoire.dev/app_dev.php/login (assuming your local virtualhost is called demo.victoire.dev) and enter these credentials to start to test Victoire:

|Login|Password|
|-----|--------|
|`anakin@victoire.io`|test|

##Victoire Core

If you have any bug or problems, you can fork and commit your changes directly on [Victoire Repo](https://github.com/Victoire/victoire)
