require 'base64'

class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :email, :title, :first_name, :last_name, :phone, :company_name,
                  :password, :password_confirmation
  has_many :orders, :dependent => :destroy

  validates_presence_of   :email
  validates_uniqueness_of :email

  validates_presence_of :first_name,  :on => :update
  validates_presence_of :last_name,   :on => :update
  validates_presence_of :phone,       :on => :update

  # This enables the 'active' magic state in Authlogic
  # confirmed magic state is enabled by default
  def active?
    enabled
  end

  def confirmation_key
    data = "#{id.to_s}-#{email}"
    crypted = data #TODO: Do the real encryption
    Base64.encode64(crypted)
  end

  def self.from_confirmation_key(key)
    return nil unless key && key.class == String
    crypted = Base64.decode64(key)
    data = crypted #TODO: Do the real decryption
    parts = /^(\d+)-(.+)$/.match(data)
    return nil if !parts || parts.length != 3
    key_id = parts[1].to_i
    key_email = parts[2]
    found = self.find(key_id)
    return nil unless found
    key_email == found.email ? found : nil
  end
end

