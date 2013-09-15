ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

def random_str(length = 8)
  (0...(length-1)).map{ ('a'..'z').to_a[rand(26)] }.join
end

def resolve_result(winner, loser)
  w = winner.kind_of?(Symbol) ? players(winner) : winner
  l = loser.kind_of?(Symbol) ? players(loser) : loser
  Result.create!(winner: w, loser: l)
end


#
# Rails
#
require 'capybara/rails'
class CapybaraTestCase < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.reset_session!
  end
end

