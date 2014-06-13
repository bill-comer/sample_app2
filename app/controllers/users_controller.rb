class UsersController < ApplicationController
  
  before_action :signed_in_user_before_filter, only: [:edit, :update, :show, :index]
  before_action :correct_user_before_filter,   only: [:edit, :update]
  
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
    @users = User.paginate(page: params[:page])
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    # Before filters

    def signed_in_user_before_filter
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
    
    def correct_user_before_filter
      @user = User.find(params[:id])
      
      if !current_user?(@user)
        flash[:error] = "You do not have permission to edit the settings for someone else!"
        redirect_to(root_url) 
      end
    end
end
