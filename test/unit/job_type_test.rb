require 'test_helper'

class JobTypeTest < ActiveSupport::TestCase
  should_validate_presence_of :name, :description, :price
end

