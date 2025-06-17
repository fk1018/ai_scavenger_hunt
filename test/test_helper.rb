ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"

module ActiveRecord
  class Migration
    def self.maintain_test_schema!; end
  end
end

require "rails/test_help"

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors)
    # Add more helper methods to be used by all tests here...
  end
end
