# Victoire demo (standard-project)

##Install

```
composer create-project victoire/demo myVictoire "1.0.*@dev"
```

Then, you have to edit app/config/victoire_core.yml and change domain names for yours:
```
    locale_pattern_table:
        my_victoire.dev: fr
        demo.victoire.fr: fr
```

Import the demo database in var/dump/db.sql

or do it yourself by doing the usual stuff.

    php bin/console doctrine:database:create
    php bin/console doctrine:schema:create
    php bin/console victoire:generate:view-cache --env=dev
    php bin/console doctrine:fixtures:load --fixtures="vendor/victoire/victoire/Bundle/CoreBundle/DataFixtures/ORM"

*Careful* : please notice that Victoire needs APC in CLI mode. to do so, add these two lines in your php.ini config file

```ini
    apc.enabled = 1
    apc.enable_cli = 1
```

Setup your virtualhost as usual and go to http://demo.victoire.dev/app_dev.php/login (assuming your local virtualhost is called demo.victoire.dev) and enter these credentials to start to test Victoire:

|Login|Password|
|-----|--------|
|`anakin@victoire.io`|test|

[https://github.com/Victoire/victoire](https://github.com/Victoire/victoire)
