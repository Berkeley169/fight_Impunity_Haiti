class UsersController < ApplicationController

  before_filter :authenticate_action, :except => [:index, :show]
  before_filter :authenticate_user, :only => [:index, :show]

  def index
    @users = User.all
    @title = 'Showing Users'
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @title = 'Add New User'
    @button_text = 'Create New User'
    @new_user = true
  end

  def create
    @user = User.new(params[:user])
    if valid_new_user
      @user.save
      if @user.valid?
        flash[:notice] = "#{@user.name} was created"
        redirect_to users_path and return
      end
    end
    flash[:notice] = "an error occurred, try again"
    redirect_to new_user_path and return
  end

  def valid_new_user
    if params[:user][:password] != ""
      return (params[:user] and params[:user][:password] == params[:user][:password_confirmation])
    end
    return true
  end

  def destroy
    if User.exists?(params[:id])
      user = User.find(params[:id])
      if not_self(user)
        flash[:notice] = user.name + ' was deleted'
        User.destroy(user.id)
      end
      redirect_to users_path and return
    end
    flash[:notice] = "User doesn't exist"
    redirect_to users_path
  end

  def not_self(user)
    if user == current_user
      flash[:notice] = 'A manager cannot delete their own account!'
      return false
    end
    return true
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit #{@user.first_name} #{@user.last_name}"
  end

  def update
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      edit_user(@user)
      if params[:user]["password"] == "" and params[:user]["password_confirmation"] == ""
        status = @user.save(validate:false)
      else
        status = @user.save
      end
      if status
        redirect_to @user, notice: "User successfully updated"
        if @editing_self
          sign_in @user, :bypass => true
        end
      else
        redirect_to edit_user_path, notice: "An error occurred, please check the user fields"
      end
    end
  end

  def form_submit_message(success,user)
    if success
      flash[:notice] = user.name + ' was updated'
    else
      flash[:notice] = 'an error occured, please try again'
    end
  end

  def edit_user(user)
    for field in params[:user].keys
      eval "user.#{field} = params[:user][field]"
    end
  end

  def authenticate_action
    if not user_signed_in?
      redirect_to new_user_session_path
      return
    end
    @editing_self = editing_self
    if @editing_self
      return
    elsif not_manager_or_tech
      flash[:notice] = "You are not permitted to do that"
      redirect_to users_path
      return
    end
  end

  def not_manager_or_tech
    current_user.role.to_sym != :Manager and current_user.role.to_sym != :Tech
  end

  def editing_self
    params[:id] == current_user.id.to_s
  end

end
