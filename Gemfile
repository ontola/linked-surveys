source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'active_response', git: 'https://github.com/ontola/active_response', branch: 'hash-arguments'
gem 'acts_as_list'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'linked_rails', git: 'https://github.com/ontola/linked_rails'
gem 'linked_rails-auth', git: 'https://github.com/ontola/linked_rails-auth'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'rdf-serializers', '~> 0.0.11'
gem 'rdf-n3'
gem 'sqlite3', '~> 1.4'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
end
