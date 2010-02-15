class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :email, :first_name, :last_name, :phone,
                  :password, :password_confirmation

  validates_presence_of :email
  validates_presence_of :first_name,  :on => :update
  validates_presence_of :last_name,   :on => :update
  validates_presence_of :phone,       :on => :update

  validates_presence_of :password, :if => :uses_password?

  def self.retrieve_from(key)
    nil
  end

  def uses_password?
    !uses_openid?
  end

  def uses_openid?
    false
  end

end

