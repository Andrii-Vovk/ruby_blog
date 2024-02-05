# README

> This is a UNIVERSITY ASSIGNMENT! Do not treat as production-ready code.

## Hello! this is the guide to my <% rubypedia %>!

## The app is deployed to [Heroku](https://rubypediaapp.herokuapp.com/?).
> You might need to wait for a little bit. Free heroku plan puts apps to hibernation if inactive for some time. So it may take up to 2 minutes for heroku to wake the server up.

## List of implemented features:

* getting started

* authentification

* authorization (+ admin mode)

* archiving articles

* search

* filtering by tag

* pagination

* uploading pictures (+ AWS S3 bucket image storing)

* heroku deployment

* some basic bootstrap styling (if you can call it a "feature" :) ) 
## Details about each feature

### 1. Getting started.

I think this is pretty self-explanatory. Just reproduced the steps from rails official site guide.

### 2. Authentification.

This feature was implemented using "devise" gem. Pretty much all actions use its "authenticate_user!" before_action, so you will not be able to do anything without being redirected to devise sign_in views.

### 3. Authorization (+ admin mode).

Authorization is being implemented using "pundit" gem. Comments and Articles have separate policies. Althought buttons that lead to unauthorized actions are hidden, you can still try to alter url, and be redirected back with an error.

> I created a special account to enter admin mode:

> login: daddy@gmail.com

> password: 123456789

> You will know that you are an admin by seeing that your nickname is red in navbar.

Admin can delete and edit any article on this blog.

If you wish to try out regular user mode, just register with a random mail.

### 4. Archiving articles.

To access archived articles, press 'archive' on main page. Articles have a "status" field, which can be set while creating or editing it. Admin can see all archived posts, regular users - only their own.

### 5. Search.

Search is very basic, it does a sql query with "LIKE". Nothing to say about it.

### 6. Filtering.

Every post has a "tag" field. A select box on main page gets all unique sorted tags, so that you can filter articles using them.

### 7. Pagination.

Pagination is implemented using ["pagy" gem](https://github.com/ddnexus/pagy). It is kept at 4 items per page for demonstraiton sake.

### 8. Uploading pictures (+ AWS S3 bucket image storing)

You can upload any picture that is below 5m and ends with .png, .jpg or jpeg.

### 9. Heroku

The app is deployed to heroku [(here)](https://rubypediaapp.herokuapp.com/)
