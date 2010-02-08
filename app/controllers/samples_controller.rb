class SamplesController < ApplicationController
  inherit_resources
  actions :index, :new, :create, :edit, :update, :destroy

  before_filter :verify_access, :except => :index

  def create
    create! { samples_url }
  end
  def update
    update! { samples_url }
  end
end

