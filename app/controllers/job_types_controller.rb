class JobTypesController < ApplicationController
  inherit_resources
  actions :index, :new, :create, :edit, :update, :destroy

  before_filter :verify_access

  def create
    create! { job_types_url } # redirect to :index instead of :show
  end
  def update
    update! { job_types_url }
  end
end

