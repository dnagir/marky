require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  context 'view dashboard' do
    context 'by public user' do
      should_eventually('be prohibited') {}
    end
    context 'loged user' do
      should_eventually('be allowed') {}
    end
  end
end

