require 'test_helper'

class JobTypeTest < ActiveSupport::TestCase
  should_validate_presence_of :name, :description, :price

  [12.00, 12.50, 12.99, 13.49].each do |price|
    context "saving job type with price equal to #{price}" do
      setup do
        @job = JobType.new(:name => 'abc', :description => 'desc', :price => price)
        @job.save!
      end
      should('be correctly fetched') do
        @job.reload
        assert_equal price, @job.price
      end
    end
  end
end

