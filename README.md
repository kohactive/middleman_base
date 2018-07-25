# Middleman Base

This repo is a base template for creating new Middleman projects at Kohactive. It's fairly opinionated.

## Setup

**Clone the repo**

```bash
$ git clone https://github.com/kohactive/middleman_base
```

**Setup your environment**
Make sure that the ruby environment files are setup properly. The default ruby version is `2.4.1` and the gemset is `middleman_base`. If you want to modify these, change the appropriate file. Don't forget to run `cd .` if you change any of those files.

**Run the setup script**

```bash
$ bin/setup
```

## Run the project

To run Middleman, simple call:

```bash
$ middleman
```

## Build

Building the app is easy, just call `middleman build`. You can optionally pass in an environment.

```bash
$ middelman build

# build staging
$ middleman build -e staging

# build production
$ middleman build -e production
```

## Managing Environments

Middleman 4 offers environment configuration. All environment configs are located in the `environments` folder. You can add new environments if you'd like, but typically we just need development, staging, and production.

## Helpers

All helper files located in `helpers` will automatically be loaded on runtime. You can add custom helper methods as your project requires. There are a few useful helpers in there to start you off.

## Routes

We use the [Middleman Router](https://github.com/kohactive/middleman-router) plugin to manage routes. You can view the documentation for more details. Add all of your routes to the `lib/routes.rb` file to get started.

## Sitemap

A sitemap builder is automatically included. You can access the sitemap locally at http://localhost:4567/sitemap.xml. Keep in mind that we gzip during production builds so the URL will be sitemap.xml.gz.
