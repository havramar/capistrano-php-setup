capistrano-php-setup
====================

Basing setup for deployment of PHP application.

* Handles multiple environments (development, staging, production).
* Notifies New Relic about deployment.
* Uses composer to download dependencies in your project.

## Setup

Download requirements:

```
sudo apt-get install ruby bundler
bundle
```

Prepare config file and fill required credentials:

```
mv config/credentials.rb.dist config/credentials.rb
```

## Deploy & Rollbacks

```
cap production deploy
cap production rollback
```
