require 'test_helper'

class UsersControllerTest < ActionController::TestCase

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
end

