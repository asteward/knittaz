#Knittaz 4 Life
###Authored by Austin Steward
***
##Description
This rails web app is a functioning pseudo-clone of Twitter built for those in the knitting community. Users may "spin yarns" (i.e. "tweet") and follow other users. Users are sent emails when they sign up, are followed by another user, and when they are "stitched" (i.e. "tagged") in a post by another user.
Users can search for other users using the navbar's `fuzzy_search` field.

***
##Setup
In your terminal, clone this repo:

```console
$ clone https://github.com/asteward/knittaz.git
```

Make sure you've installed [postgres](http://www.postgresql.org/download/) and have started the server:

```console
$ postgres
```

Install all the dependencies:

```console
$ bundle install
```

Set up the databases on your local machine:

```console
$ rake db:create
$ rake db:migrate
```

Finally, start the rails server:

```console
$ rails s
```
It should now be available at `localhost:3000`.

***
##Dependencies
- [Bootstrap](http://getbootstrap.com/)
- [Bootstrap.min.js](http://getbootstrap.com/javascript/)
- [jQuery](http://jquery.com/)
- [Sass](http://sass-lang.com/)

***
##Licensing
- [MIT](http://opensource.org/licenses/MIT)
