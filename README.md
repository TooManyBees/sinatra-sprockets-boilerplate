# Sinatra Boilerplate

Unraveling the eldritch mystery that is *Sprockets outside of rails* is a task that has addled my feeble mortal mind for far too long. This starter app ensures it never again casts its long shadow across my new Sinatra apps.

Starter app that includes:
  * [Sinatra](https://github.com/sinatra/sinatra)
  * [Sprockets](https://github.com/rails/sprockets)
  * [Sass](https://github.com/sass/sass)
  * [Sequel](https://github.com/jeremyevans/sequel/) & Postgres
  * Nginx & Unicorn

Sequel/Postgres/Nginx/Unicorn are not as wholly baked into the setup as Sprockets. The point of this boilerplate repo is really just to get an easy asset pipeline working out of the box. All other opinions proclaimed by this app are optional to its functionality.

Unicorn and nginx configs assume the app's location to be `/opt/www`
