Magic Smoke
===========

An instant smoke test suite for your Rails 3 app. It just checks to make sure you haven't broken any pages.

How does it work?
-----------------

1. Reads your app's routes
2. Check all GET requests return 200s

Installation
------------

Right now we only support Rails 3 apps, just add the following line to the `:test` group of your `Gemfile`:

    gem 'magic_smoke'

Your `Gemfile` will look something like this:

    group :test do
      gem 'magic_smoke'
    end

