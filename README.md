# Victoire demo (standard-project)

##Install

```
composer create-project victoire/demo myVictoire "1.0.*@dev"
```

Import the demo database in var/dump/db.sql

or do it yourself by doing the usual stuff.

    php bin/console doctrine:database:create
    php bin/console doctrine:schema:create
    php bin/console victoire:generate:view-cache --env=dev
    php bin/console doctrine:fixtures:load --fixtures="vendor/victoire/victoire/Victoire/Bundle/CoreBundle/DataFixtures/ORM"


Setup your virtualhost as usual and go to http://demo.victoire.dev/app_dev.php/login (assuming your local virtualhost is called demo.victoire.dev) and enter these credentials to start to test Victoire:

|Login|Password|
|-----|--------|
|`anakin@victoire.io`|test|

[https://github.com/Victoire/victoire](https://github.com/Victoire/victoire)
