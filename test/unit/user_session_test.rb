require 'test_helper'
require "authlogic/test_case"

class UserSessionTest < ActiveSupport::TestCase
  setup :activate_authlogic

  [ {:confirmed => true,  :enabled => true},
    {:confirmed => false, :enabled => false},
    {:confirmed => false, :enabled => true},
    {:confirmed => true,  :enabled => false}].each do |data|
    context "Confirmed=#{data[:confirmed]} and Enabled=#{data[:enabled]} user" do      
      setup do
        email, pwd = 'here@there.com', '12345'
        Factory.create( :user,
                        :email => email, :password => pwd, :password_confirmation => pwd,
                        :enabled => data[:enabled], :confirmed => data[:confirmed])
        @session = UserSession.new(:email => email, :password => pwd, :remember_me => false)        
      end

      should("ensure login") do
        allow_login = data[:confirmed] && data[:enabled]
        assert @session.valid? == allow_login
      end
    end
  end
end

