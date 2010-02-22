require 'test_helper'

class RegistrationTest < ActionController::IntegrationTest

  context "A visitor registration" do
    setup { go_to_registration }

    context 'with email/password' do
      setup do
        @user = submit_registration_with(:email => 'some@email.com')
      end
      should('see confirmation page') do
        assert_template :confirm
      end
      context 'following confirmation email' do
        setup { follow_confirmation_email @user }
        should_redirect_to('account page') { account_url }
      end
    end

    context 'with OpenID' do
      should_eventually('start testing')
      # continue_to_contact_details
    end
  end




  private

  # Just opens the registration page
  def go_to_registration
    get '/account/new'
    assert_response :success
  end

  # Fills in the registration form and submits it
  def submit_registration_with (options = {})
    options = Factory.attributes_for(:user).merge(options)
    post '/account', :user => options
    assert_select 'span', options[:email]
    return assigns(:user)
  end

  # Opens the link from the email sent to a user
  def follow_confirmation_email(user)
    get '/accounts/verify', :key => user.confirmation_key
  end
end

