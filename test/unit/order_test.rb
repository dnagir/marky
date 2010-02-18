require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  validate_numericality_of :amount
  should_belong_to :user
  should_validate_presence_of :user
    
  [0, 10, 11.5, 12.5, 13.99, 2500].each do |amount|
    context "Saving amount #{amount}" do
      setup do 
        @user = Factory.create(:user)
        @order = Order.new(:amount => amount, :user => @user)
      end
      should('be able to save') do
        assert @order.save
      end      
      should('be able to retrieve') do
        @order.save
        assert @order.reload.amount == amount
      end
    end
  end
  
  [-1, -5, -0.00001].each do |amount|
    context "Amount of #{amount}" do
      setup { @order = Order.new(:amount => amount) }
      should ' not be allowed' do
        assert !@order.valid?
        assert_not_nil @order.errors[:amount]
      end
    end
  end
  
end
