class ActionController::IntegrationTest

  # Just opens the registration page
  def go_to_registration
    get '/login'
    assert_response :success
  end

  # Just opens the login page
  def go_to_login
    go_to_registration
  end

  # Fills in the registration form and submits it
  def submit_registration_with (options = {})
    options = Factory.attributes_for(:user).merge(options)
    post '/users', :user => options
    assert_response :success
    assert_template :confirm
    user = assigns(:user)
    assert_not_nil user
    user
  end

  # Opens the link from the email sent to a user
  def follow_confirmation_email(user)
    get '/users/verify', :key => 'bla'
    assert_response :success
    assert_template :confirm
    user = assigns(:user)
    assert_not_nill user
    # Confirmation page is open, now press confirm!
    user.stubs(:verify_confirmation_key).returns(true)
    post_via_redirect '/users/confirm', :key => 'bla'
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
end

