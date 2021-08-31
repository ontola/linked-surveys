# Linked-Surveys

Create linked data (RDF) Surveys! Build forms using an ontology. Designed to work with [cashlink](https://gitlab.com/ontola/cashlink), which enables you to financially reward surveys!

## Installing & running locally

- `git clone https://gitlab.com/ontola/linked-surveys`
- Install ruby 2.6.1 (preferably using rvm or rbenv) and bundle
- Setup the .env
- `bundle install`. If you're on a mac and have `pg_config` errors install postgres `brew install postgresql`, and imagemagick with `brew link --force imagemagick@6`
- `bundle exec rake db:setup`
- `bundle exec rails s -b 0.0.0.0 -p 3000`
- `RAILS_ENV=staging bundle exec rails s -b 0.0.0.0 -p 3000` if you want more performance and less debugging

_note: We're still cleanign up this repository, so expect changes in the coming weeks that help you run this locally!_
