require 'capybara/rspec'
require 'capybara/poltergeist'
require 'pry'

Dir.glob('spec/steps/*steps.rb') { |f| load f, true }

Capybara.default_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end
