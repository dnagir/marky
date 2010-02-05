class SamplesController < ApplicationController
  before_filter :verify_access, :except => :index

  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_not_found

  def index
    @samples = Sample.find(:all)
  end

  def new
    @sample = Sample.new
  end

  def edit
    @sample = Sample.find(params[:id])
  # rescue ActiveRecord::RecordNotFound
  #   redirect_to samples_url
  end

  def create
    @sample = Sample.new(params[:sample])

    if @sample.save
      flash[:notice] = 'Sample was successfully created.'
      redirect_to samples_path
    else
      render :action => :new
    end
  end

  def update
    @sample = Sample.find(params[:id])
    if @sample.update_attributes(params[:sample])
      flash[:notice] = 'Sample was successfully updated.'
      redirect_to samples_path
    else
      render :action => :edit
    end
  end

  def destroy
    @sample = Sample.find(params[:id])
    @sample.destroy
    redirect_to samples_url
  end

  private

  def rescue_not_found
    flash[:notice] = "This record is no longer with us!"
    redirect_to samples_url
  end
end

