class UserSession < Authlogic::Session::Base
  attr_accessor :email, :password, :remember_me
end

