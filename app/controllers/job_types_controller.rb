class JobTypesController < ApplicationController
  inherit_resources
  actions :index, :new, :create, :edit, :update, :destroy

  before_filter :require_admin

  def create
    create! { job_types_url }
  end
  def update
    update! { job_types_url }
  end
end

