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
      should('end up on contact info page') { assert_equal '/account', path }      
      context 'providing contact details' do
        setup { send_contact_info }
        should('enable user') { assert @user.enabled }
        should('finish on the order page') { assert_equal new_order_url, path }
      end
    end



    context 'with OpenID' do
      should_eventually('start testing')
      # continue_to_contact_details
    end
  end
end

