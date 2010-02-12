class SamplesController < ApplicationController
  inherit_resources
  actions :index, :new, :create, :edit, :update, :destroy

  before_filter :require_admin, :except => :index
  
  def create
    create! { samples_url }
  end
  def update
    update! { samples_url }
  end
end

