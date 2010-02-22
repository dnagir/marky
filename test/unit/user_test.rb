require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_validate_presence_of   :email, :first_name, :last_name, :phone
  should_allow_values_for       :email, "q@domain.com", "fn.ln@some.where.co.uk", "12.abc@12.here.com"
  should_not_allow_values_for   :email, "123", "abcd", "@@@"
  should_have_many              :orders
  should_not_allow_mass_assignment_of :enabled, :confirmed, :orders

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

  test 'default user is enabled' do
    assert User.new.enabled
  end

  test 'confirmation key can be encrypted and decrypted' do
    u1 = Factory.create(:user)
    first = u1.confirmation_key
    u2 = User.from_confirmation_key first
    assert_same u1.id, u2.id
  end

  [nil, 123, String, 'wrongyy'].each do |key|
    context "Faked confirmation key #{key}" do
      should('should be invalid') { assert_nil User.from_confirmation_key(key) }
    end
  end

  context "User already exists" do
    setup { @existing = Factory.create(:user) }
    should('no be able to save new user with same existing email') do
      user = Factory.build(:user, :email => @existing.email)
      assert !user.valid?
      assert_not_nil user.errors[:email]
    end
  end

  context 'Validation' do
    context 'for existing user' do
      setup { @u = Factory.create(:user) }
      context 'changing first name only' do
        setup { @u.first_name = 'james' }
        should('allow saving') { assert @u.save }
      end
      context 'setting a blank password' do
        setup { @old = @u.crypted_password; @u.password = nil; @u.password_confirmation = nil }
        should('is ignored') do
          assert_equal @old, @u.crypted_password
        end
      end
      context 'setting a new password' do
        setup { @old = @u.crypted_password; @u.password = 'abcde'; @u.password_confirmation = 'abcde' }
        should('change it') { assert_not_equal @old, @u.crypted_password }
        should('allow saviing') { assert @u.valid? }
      end
    end

    context 'for a new user' do
      setup { @u = User.new }
      context 'leaving a blank password' do
        should('not allow saving') do
          assert !@u.valid?
          assert @u.errors[:password]
        end
      end
    end
  end

end

