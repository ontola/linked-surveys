# Linked-Surveys

Create linked data (RDF) Surveys! Build forms using an ontology. Designed to work with [cashlink](https://gitlab.com/ontola/cashlink), which enables you to financially reward surveys!

## Installing & running locally

- Install ruby (preferably using rvm or rbenv) and bundle
- `git clone https://gitlab.com/ontola/linked-surveys`
- Setup the .env
- `bundle install`
- `bundle exec rake db:setup`
- `bundle exec rails s -b 0.0.0.0 -p 3000`
- `RAILS_ENV=staging bundle exec rails s -b 0.0.0.0 -p 3000` if you want more performance and less debugging
