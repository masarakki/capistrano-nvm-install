# capistrano-nvm-install

capistrano task **only** for installing nvm and node automatically.
it hooks [capistrano-nvm](https://github.com/koenpunt/capistrano-nvm) task, so you also have to use `capistrano-nvm` .

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'capistrano-nvm', require: false
  gem 'capistrano-nvm-install', require: false
end
```

## Usage

```ruby
# Capfile.rb
require 'capistrano/nvm'
require 'capistrano/nvm-install'
```
