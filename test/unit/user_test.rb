require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_validate_presence_of :email

  test 'initial user is valid' do
    assert Factory.build(:user).valid?
  end

  test 'can confirm and update user' do
    u = Factory.create(:user)
    u.first_name  = 'first'
    u.last_name   = 'last'
    u.phone       = '1256756233'
    u.confirmed   = true
    assert u.save
  end

  test 'user from factory is valid' do
    assert Factory.build(:user).valid?
  end
end

