class SessionsController < ApplicationController

  skip_before_filter :authenticate

  def create
    if  (user = User.authenticate(params[:email], params[:password]))
      session[:user_id.to_s] = user.id
      redirect_to coupons_path, :notice => "Logged in successfully"

      #elsif (client = User.authenticate(params[:email], params[:password]))
       # session[:user_id.to_s] = user.id
        #redirect_to current_client_path, :notice => "Logged in successfully"

    else
      flash.now[:alert] = "Invalid login/password combination"
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id.to_s] = nil
    redirect_to root_path, :notice => "You successfully logged out"
  end

  def authenticate
    unless User.find_by_id(session[:user_id.to_s])
      redirect_to login_url, :notice => "Please log in"
    end
  end
end
