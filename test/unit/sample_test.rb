require 'test_helper'

class SampleTest < ActiveSupport::TestCase
  should_validate_presence_of :title, :description

  context 'no images attached' do
    setup { @sample = Sample.new(:title => 'abc', :description => 'desc') }

    should 'reports sample as invalid' do
      assert @sample.valid?
    end

    should 'have errors' do
      @sample.valid?
      puts @sample.errors.inspect
      assert @sample.errors[:original_image]
      assert @sample.errors[:processed_image]
    end
  end
end

