class OrdersController < ApplicationController
  inherit_resources
  actions :new, :create
  before_filter :require_user  
end

