# GDI TAMS

![Codeship Status for gdichicago/gdi-tams](https://codeship.com/projects/e87d9e80-d98c-0132-4083-663757f654ab/status?branch=stable)](https://codeship.com/projects/79037)

TAMS: Teaching Assistant Management System

A little Rails app that handles teaching assistant sign ups, emails, and reporting.

Deploy to Heroku using Unicorn with Resque for background jobs.

Staging and production environments available.

`stable` branch is production.

`staging` branch is staging.

Migrations are ran upon deploy automatically.

## Running locally

Make your database and stuffs:

```
$ bundle
$ rake db:create && rake db:migrate
```

And you should probably create an Admin user:

```
$ rails c
$ Admin.create!(name: "Me", password: "hello", password_confirmation: "hello", email: "email@domain.com")
```

And then to start up, you need Redis running:

```
$ redis-server
```

And launch the app using Foreman:

```
$ foreman start
```

## Configuring environmental parameters

There are several environment variables that need to be set in order to customize TAMS for your chapter:

- `CHAPTER_NAME` : defaults to "GDI Chicago". A case-sensitive, human-readable expression of your chapter name.
- `BASE_URL` : defaults to "gdichicago.com". The URL where you will be hosting this version of TAMS.
- `FROM_EMAIL` : defaults to "chicago@girldevelopit.com". The email from which all emails will be sent.
- `FROM_EMAIL_NAME` : defaults to "GDI Chicago". The human-readable name which emails will be sent with.
- `MATERIALS_URL`: defaults to "gdichicago.com/classes". The URL where course materials are available for TAs.

## Deployment Instructions