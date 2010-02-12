class UsersController < ApplicationController
  filter_parameter_logging :password, :password_confirmation
  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.valid?
    if @user.save
      flash.now[:notice] = "Account registered, pending confirmation!"
      render :action => :confirm
    else
      render :action => :new
    end
  end


  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to dashboard_url
    else
      render :action => :edit
    end
  end
end

