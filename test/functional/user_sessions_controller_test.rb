require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  context 'Public user on login' do
    setup { get :new }
    should_respond_with :success
    should_render_template :new
  end
end

