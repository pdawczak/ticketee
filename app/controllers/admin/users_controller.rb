class Admin::UsersController < Admin::BaseController
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]

  def index
    @users = User.all :order => "email"
  end

  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    
    set_admin
    if @user.save
      redirect_to admin_users_path, :notice => "User has been created."
    else
      flash[:alert] = "User has not been created."
      render :new
    end
  end

  def edit
    
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end

    set_admin
    if @user.update_attributes params[:user]
      redirect_to admin_users_path, :notice => "User has been updated."
    else
      flash[:alert] = "User has not been updated."
      render :new
    end
  end

  def destroy
    if @user == current_user
      flash[:alert] = "You cannot delete yourself!"
      redirect_to :back
    else
      @user.delete
      redirect_to admin_users_path, :notice => "User has been deleted."
    end
  end
  
  private
    
    def find_user
      @user = User.find params[:id]
    end

    def set_admin
      @user.admin = params[:user][:admin] == "1"
    end
end
