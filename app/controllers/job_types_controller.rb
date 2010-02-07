class JobTypesController < ApplicationController
  before_filter :verify_access

  def index
    @job_types = JobType.find(:all)
  end

  def new
    @job_type = JobType.new
  end

  def edit
    @job_type = JobType.find(params[:id])
  end

  def create
    @job_type = JobType.new(params[:job_type])

    if @JobType.save
      flash[:notice] = 'Job type was successfully created.'
      redirect_to job_types_path
    else
      render :action => :new
    end
  end

  def update
    @job_type = JobType.find(params[:id])
    if @job_type.update_attributes(params[:job_type])
      flash[:notice] = 'Job type was successfully updated.'
      redirect_to job_types_path
    else
      render :action => :edit
    end
  end

  def destroy
    @job_type = JobType.find(params[:id])
    @job_type.destroy
    redirect_to job_types_url
  end

  private

  def rescue_not_found
    flash[:notice] = "This record is no longer with us!"
    redirect_to job_types_url
  end
end

