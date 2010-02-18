class Order < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  validates_numericality_of :amount, :greater_than_or_equal_to => 0
end
