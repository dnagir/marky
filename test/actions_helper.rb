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
    post '/account', :user => options
    assert_select 'span', options[:email]
    return assigns(:user)
  end

  # Opens the link from the email sent to a user
  def follow_confirmation_email(user)
    get '/accounts/verify', :key => user.confirmation_key
    assert_response :success
    assert_template :verify
    post_via_redirect '/accounts/verify_details',
      :key => user.confirmation_key,
      :user => Factory.attributes_for(:active_user)
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

