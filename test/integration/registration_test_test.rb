require 'test_helper'
require 'actions_helper'

class RegistrationTestTest < ActionController::IntegrationTest


  context "A visitor registration" do
    setup { go_to_registration }


    context 'with email/password' do
      setup do
        @user = send_registration_with :email => 'some@email.com', :password => 'some password'
      end
      should('be created as inactive user') do
        assert @user.saved?
        assert @user.confirmed == false
        assert @user.enabled == false
      end
      context 'follows confirmation email' do
        setup { follow_confirmation_email @user }
        should('activate the user') do
          assert @user.confirmed
          assert @user.enabled == false
        end
      end
      should('end up on contact info page') { assert_equal edit_profile_url, path }
      continue_to_contact_details
    end



    context 'with OpenID' do
      should_eventually('start testing')
      # continue_to_contact_details
    end
  end
end

