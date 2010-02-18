require 'test_helper'
require 'actions_helper'

class RegistrationTest < ActionController::IntegrationTest

  context "A visitor registration" do
    setup { go_to_registration }

    context 'with email/password' do
      setup do
        @user = submit_registration_with(:email => 'some@email.com')
      end
      should('be created as inactive user') do
        assert !@user.new_record?
        assert @user.reload.confirmed == false
      end
      context 'following confirmation email' do
        setup { follow_confirmation_email @user }
        should('activate the user') do
          assert @user.reload.confirmed == true
        end
      end
      should('end up on account page') { assert_equal '/account', path }
    end

    context 'with OpenID' do
      should_eventually('start testing')
      # continue_to_contact_details
    end
  end
end

