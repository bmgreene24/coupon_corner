class UsersController < ApplicationController
  before_filter :authenticate, :except => [:create]

  def new
    @user = User.new
    #Client.create(:name,:password )
  end

  def create
    @user = User.new(params[:user])
    #@user.type = "Client"
    @user.last_login = DateTime.now()
      if @user.save
        if current_user and current_user.admin
          redirect_to users_path, :notice => 'User creation successful!'
        else
          session[:user_id.to_s] = @user.id
          redirect_to coupons_path, :notice => 'User creation successful!'
        end
      #elsif @user.save.type == "Client"
        #session[:client_id.to_s] = @user.id

      else
        render :action => 'new', :notice => 'User creation failed!'
      end
  end

  def authenticate
    unless User.find_by_id(session[:user_id.to_s])
      redirect_to login_url, :notice => "Please log in"
    end
  end

  def index
    redirect_to(root_url) unless current_user.admin
    @users = User.all
  end

  def edit
    return unless (params[:id] = current_user.id.to_s()) or current_user.admin
    @user = User.find(params[:id])
  end

  def show
    return unless (params[:id] == current_user.id.to_s()) or current_user.admin
    @user = User.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        @user.email = params[:email]
        @user.password = params[:password]
        #@user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User details were successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    return unless current_user.admin?
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted."

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end