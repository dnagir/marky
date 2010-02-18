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
      post :create, :user => {
        :email => 'email@email.com',
        :first_name => 'first', :last_name => 'last',
        :password => '12345', :password_confirmation => '12345'}
    end
    should_respond_with :success
    should_render_template :confirm
    should('enable user ')      { assert assigns(:user).enabled }
    should('not confirm user ') { assert !assigns(:user).confirmed }
    should('display email')     { assert_select 'span', 'email@email.com' }
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
    setup do
      @user = Factory.create(:user, :confirmed => false)
      assert !@user.confirmed # just make sure the pre-condition is met
    end
    context 'with correct key' do
      setup { get :verify, :key => @user.confirmation_key }      
      should_respond_with :success
      should_render_template :verify
    end
    context 'confirming details with correct info' do
      setup do
        post :verify_details, 
          :key => @user.confirmation_key,
          :user => Factory.attributes_for(:active_user)
      end
      should_set_the_flash_to /confirmed/i
      should('confirm user') { assert assigns(:user).confirmed }
      should_redirect_to('account page') { account_url }
    end
    context 'confirming details with invalid info' do
      setup do
        post :verify_details, :key => @user.confirmation_key
      end
      should_respond_with :success
      should_render_template :verify
      should('NOT confirm user') { assert !assigns(:user).confirmed }
    end
    context 'with invalid key' do
      setup { get :verify, :key => 'definitely wrong confirmation key' }
      should_set_the_flash_to /invalid/i
      should_redirect_to('login') { login_url }      
      should 'NOT confirm user' do
        assert !@user.confirmed
      end
    end        
  end
  
  test 'verification routing' do
    assert_generates '/accounts/verify', :controller => 'accounts', :action => 'verify'
    assert_generates '/accounts/verify_details', :controller => 'accounts', :action => 'verify_details'
  end

end

