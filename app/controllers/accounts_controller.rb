class AccountsController < ApplicationController
  filter_parameter_logging :password, :password_confirmation
  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user,      :only => [:edit, :update]
  before_filter :require_http_post, :only => :verify_details

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
  
  def verify
    @user = User.from_confirmation_key(params[:key])
    if !@user
      flash[:warn] = 'Invalid key, please check your email.'
      redirect_to login_url unless @user
    end    
  end
  
  def verify_details
    @user = User.from_confirmation_key(params[:key])
    if @user
      if @user.update_attributes(params[:user])
        @user.confirmed = true
        @user.save!
        flash[:notice] = 'Email has been confirmed, now you can log-in.'
        redirect_to account_url
      else
        render :action => :verify
      end      
    else
      flash[:warn] = 'Invalid key, please check your email.'
      redirect_to login_url
    end    
  end
end

