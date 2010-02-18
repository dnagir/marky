# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user


  protected

  def require_http_post
    self.request.post?
  end
  
  def require_admin
    require_user
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
      return false
    end
  end

#  def require_no_user
#    if current_user
#      store_location
#      flash[:notice] = "You must be logged out to access this page"
#      redirect_to root_url
#      return false
#    end
#  end
end

