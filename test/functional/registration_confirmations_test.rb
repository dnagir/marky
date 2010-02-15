require 'test_helper'

class RegistrationConfirmationsControllerTest < ActionController::TestCase

  [true, false].each do |is_valid|
    context "User verification with key valid=#{is_valid}" do
      setup do
        @user = Factory.create(:user)
        User.stubs(:retrieve_from).returns(is_valid ? @user : nil)
      end
      context "just clicking the link" do
        setup { get :new }
        should_respond_with :success
        should_render_template :new

        should_assign_to(:user)     if is_valid
        should_not_assign_to(:user) unless is_valid
        should('not confirm user') do
          assert !@user.confirmed
        end
      end
      context "has been submitted thus" do
        setup { post :create }
        should_redirect_to('user account') { user_url(@user) }  if is_valid
        should_set_the_flash_to(/invalid/i)                     unless is_valid
        should("have confirmed equal to #{is_valid}") do
          assert @user.confirmed == is_valid
        end
      end
    end
  end
end

