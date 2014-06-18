class UsersController < ApplicationController
  
  before_action :signed_in_user, only: [:edit, :update, :show, :index, :destroy, :following, :followers]
  before_action :correct_user_before_filter,   only: [:edit, :update]
  before_action :admin_user_before_filter,     only: :destroy
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  def edit
    Rails.logger.info "BILL-Editing"
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    Rails.logger.info "BILL-Updating,id[" + params[:id] + "], valid user[" + @user.valid?.to_s + "]"
    
    if @user.update_attributes(user_params)
      # Handle a successful update.
      Rails.logger.info "BILL-Thaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaat worked"
      flash.now[:success] = "User settings changed."
      render 'edit'
    else
      if (!@user.valid?)
        Rails.logger.info "BILL-errors[" + @user.errors.full_messages.to_s + "]"
      end
      Rails.logger.info "BILL-Ooooooooooooooooooooooooooooooooooooooooooooops user[" + @user.id.to_s + "]"
      render 'edit'
    end
  end
  
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], :per_page => 8)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Signup Successful. Welcome to the Sample App!"
      redirect_to signin_url, notice: "Now sign in please." unless signed_in?
    else
      render 'new'
    end
  end
  
  def index
    @users = User.paginate(page: params[:page], :per_page => 5)
  end
  
  def destroy
    username = User.find(params[:id]).name
    User.find(params[:id]).destroy
    flash[:success] = "User '" + username + "' deleted."
    redirect_to users_url
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    # Before filters

    def correct_user_before_filter
      @user = User.find(params[:id])
      
      if !current_user?(@user)
        flash[:error] = "You do not have permission to edit the settings for someone else!"
        redirect_to(root_url) 
      end
    end
    
    def admin_user_before_filter
      redirect_to(root_url) unless current_user.admin?
    end
end
