class ActionController::IntegrationTest

  # Just opens the registration page
  def go_to_registration
    get '/login'
    assert_response :success
    should_render_template :login
  end

  # Just opens the login page
  def go_to_login
    go_to_registration
  end

  # Fills in the registration form and submits it
  def send_registration_with (options = {})
    post '/login', options
    user = assigns(:user)
    assert_not_nil user
    follow_redirect!
    user
  end

  # Opens the link from the email sent to a user
  def follow_confirmation_email(user)
    # Mock the hash verification
    user.expect(:verify_confirmation_key).returns(true)

    get '/profile/confirm', :key => 'bla'
    assert_response :success
    should_render_template :confirm
    user = assigns(:user)
    assert_not_nill user
    # Confirmation page is open, now press confirm!
    post_via_redirect '/profile/confirm', :key => 'bla'
  end

  # Submits the contact information after credentials verification
  def send_contact_info
    post '',  :title => 'Mr',
              :first_name => 'first',
              :last_name => 'last',
              :company_name => 'my company',
              :email => 'modify@email.here',
              :phone => '+ 0(1) 2345678'
  end


  def self.continue_to_contact_details
    context 'providing contact details' do
      setup { send_contact_info }
      should('enable user') { assert @user.enabled }
      should('finish on the order page') { assert_equal new_order_url, path }
    end
  end
end

