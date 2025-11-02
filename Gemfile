# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.4.1"

gem "active_model_serializers"
gem "bcrypt"
gem "bootsnap", require: false
gem "logger"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rack-cors"
gem "rails", "~> 8.1.1"
gem "ridgepole"
gem "solid_queue"
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "bullet"
  gem "committee-rails"
  gem "database_rewinder"
  gem "debug", platforms: %i[mri windows]
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec"
end

group :development do
  gem "html2haml"
  gem "letter_opener"
  gem "letter_opener_web"
end
