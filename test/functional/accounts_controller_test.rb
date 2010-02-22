require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
   tests AccountsController

  context 'Open the registration' do
    setup { get :new }
    should_respond_with :success
    should_render_template :new
  end

  context 'Register with blank fields' do
    setup { post :create }
    should_respond_with :success
    should_render_template :new
    should('has errors') { assert !assigns(:user).errors.empty? }
  end

  context 'Register with valid data' do
    setup do
      post :create, :user => Factory.attributes_for(:user)
      @user = assigns(:user)
    end    
    should_respond_with :success
    should_render_template :confirm
    should('enable user ')      { assert @user.enabled }
    should('not confirm user ') { assert !@user.confirmed }
    should('display email')     { assert_select 'span.email', @user.email }
  end

  [:edit, :update].each do |action|
    context "Doing '#{action}' by non-user" do
      setup { get action }
      should_redirect_to('login') { login_url }
    end
  end

  context "Update all details" do
    setup do
      @u = Factory.create(:user)
      @controller.stubs(:current_user).returns(@u)
      post :update, :user => {
        :email => 'new@new.domain.com',
        :first_name => 'updated fn', :last_name => 'updated ln',
        :phone => '1'*10}
    end
    should('save data') do
      @u.reload
      assert_equal 'new@new.domain.com', @u.email
      assert_equal 'updated fn', @u.first_name
      assert_equal 'updated ln', @u.last_name
      assert_equal '1111111111', @u.phone
    end
  end
  
  context "Account verification" do
    setup { @key = Factory.create(:user, :confirmed => false).confirmation_key }
    context 'with correct key' do
      setup { get :verify, :key => @key }
      should_redirect_to('account page') { account_url }
    end
    context 'with invalid key' do
      setup { get :verify, :key => 'definitely wrong confirmation key' }
      should_set_the_flash_to /invalid/i
      should_redirect_to('login') { login_url }
    end
  end
  
  test 'verification routing' do
    assert_generates '/accounts/verify', :controller => 'accounts', :action => 'verify'
  end

end

