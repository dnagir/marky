require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  context 'Login page' do
    setup { get :new }
    should_respond_with :success
    should_render_template :new
    should('include login form') do
      assert_select 'form[action=?]', '/user_session'
    end
    should('include registration link') do
      assert_select 'div.register a[href=?]', '/account/new'
    end
  end
  
  context 'Successful login' do
    setup do
        email, pwd = 'here@there.com', '1234'
        Factory.create(:user, :enabled => true, :confirmed => true,
            :email => email, :password => pwd, :password_confirmation => pwd)
        post :create, :user_session => {:email => email, :password => pwd }
    end    
    should_redirect_to('account') { account_url }
  end
end

