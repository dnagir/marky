class RegistrationConfirmationsController < ApplicationController

  def new
    @user = User.retrieve_from(params[:key])
  end

  def create
    @user = User.retrieve_from(params[:key])
    if @user && !@user.confirmed
      @user.confirmed = true
      @user.save
      redirect_to user_url(@user)
    else
      flash[:error] = "Invalid key"
      render :action => :new
    end
  end

end

