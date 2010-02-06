require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "home has needed links" do
    get :index
    assert_select 'a', 'Samples'
    assert_select 'a', 'Account'
  end

  test 'public pages ara available' do
    check_page 'contact', /Contact/
    check_page 'terms', /Terms/
    check_page 'privacy', /Privacy/
  end


  test 'routes' do
    assert_routing '/', :controller => 'home', :action => 'index'
    assert_routing '/contact', :controller => 'home', :action => 'contact'
    assert_routing '/terms', :controller => 'home', :action => 'terms'
    assert_routing '/privacy', :controller => 'home', :action => 'privacy'
  end



  private

  def check_page(page, content)
    get page
    assert_response :success
    assert_select 'h1', content
  end


end

