require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  context "Non authenticated user" do
    [:new, :create].each do |action|
      context "doing '#{action}' " do
        setup { post action }
        should_redirect_to('login') { login_url }
      end      
    end    
  end
end

