# :skunk:
this is **not** an official kobotoolbox repository, okay?

# enketo-dev
*have your Enketo and develop it, too!*

## goal
As a developer, I would like to run things I don't change inside Docker
(KoboToolbox and associated databases, and Redis). I would like full,
manual control over running code that I do change (Enketo Express).
I would like simplicity in configuration with sensible defaults and a
minimum of mandatory customization. If this sounds like a topsy-turvy
[kobo-no-docker](https://github.com/jnm/kobo-no-docker/), that's because it is :)

## getting started
1. clone this repository
1. execute `first-run.sh`, which will:
    * pull docker images
    * start databases
    * run kpi and kobocat database migrations
    * prompt you to create a superuser
    * remind you that you shouldn't test things as a superuser :)
1. `docker-compose up`, which should yield:
    * kpi running on 10.6.7.1:8006
    * kobocat running on 10.6.7.1:8007
    * postgres, on 10.6.7.1:60666
    * redis, on 10.6.7.1:60667
    * mongo, on 10.6.7.1:60668
1. set up an Enketo (javascript) development environment!
    1. clone https://github.com/enketo/enketo-express
    1. :dart: copy the file `enketo-config.json` to `config/config.json` inside
       your `enketo-express` clone
    1. `cd` into your `enketo-express` source directory
    1. `nvm use 16`, or whatever you cool kids like
    1. important: `npm install -g npm@6`. [(why?)](https://github.com/enketo/enketo-express/issues/240)
    1. `npm install`
        * don't be surprised if "extract:rxjs" appears to be stuck for *seven*
          or more minutes
    1. `npx grunt develop`
    1. now Enketo should be running on port 8005 (at 10.6.7.1 as well as all
       your other IPs!)
        * verify by going to http://10.6.7.1:8005/
1. test it out
    1. log into kpi at http://10.6.7.1:8006/
    1. create and deploy a new form
    1. verify that it opens in Enketo
    1. make some change to Enketo: for example, modify
       `console.log('autosave successful')` in
       `public/js/src/module/controller-webform.js`
    1. watch for Enketo to automatically reload with your changes

## hints
1. django is set to use the console email backend, so you can do things like
   create user accounts and read the activation email details right from the
   logs of the kpi container, i.e. `docker-compose logs -f kpi`.

## nasties
* some things just don't work without nginx (like serving attachments? need to
  confirm)
