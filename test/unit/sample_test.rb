require 'test_helper'

class SampleTest < ActiveSupport::TestCase
  should_validate_presence_of :title, :description
  should_ensure_length_in_range :title, 5..20
  should_ensure_length_in_range :description, 10..50

  context 'no images attached to sample' do
    setup do
      @sample = Sample.new(:title => 'abc', :description => 'desc')
      @sample.valid?
    end

    should 'have errors' do
      assert @sample.errors[:original_image_file_name]
      assert @sample.errors[:processed_image_file_name]
    end
  end
  
  test 'sample from factory is valid' do
    sample = Factory.build(:sample)
    assert sample.valid?
    #puts sample.errors.full_messages    
  end
end

