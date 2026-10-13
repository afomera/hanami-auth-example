# Notebook

A small Hanami app (on Hanami main) showing [hanami-auth](https://github.com/afomera/hanami-auth)'s
`hanami generate auth`. Anyone can see the home page. Your notes need you to sign in, and you only
ever see your own.

## Running it

```
bin/setup        # or: bundle install && npm install && bundle exec hanami db prepare
bundle exec hanami dev
```

Open http://localhost:2300 and sign in as `demo@example.com` with password `notebook demo password`.

Password reset emails aren't sent in development unless you configure SMTP (see `.env`). Instead,
the reset link is logged to the server output.

## What the generator wrote

The commits tell the story:

1. `hanami new` on Hanami main.
2. Add hanami-turbo, and hanami-auth to the `:cli` group.
3. `hanami generate auth`: everything it wrote, untouched.
4. The app on top: a public `home.show` (`allow_unauthenticated_access`) and protected `notes`
   actions scoped to `current_user`.

## Tests

```
bundle exec rspec
```

`spec/requests/authentication_spec.rb` came from the generator. `spec/requests/notes_spec.rb`
covers the public and protected pages.
