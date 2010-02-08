require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  context 'home page' do
    setup { get :index }
    should_render_template :index
    should('have link to samples') do
      assert_select 'a', 'Samples'
    end
    should('be the application root') do
      assert_routing '/', :controller => 'home', :action => 'index'
    end
  end

  [:terms, :privacy, :contact].each do |page|
    context "visit Home-#{page}" do
      setup { get page }
      should_respond_with :success
      should_render_template page
      should('be in application root') do
        assert_routing "/#{page}", :controller => 'home', :action => page.to_s
      end
    end
  end
end

