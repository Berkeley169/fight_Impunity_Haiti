class Dashboard::UsersController < DashboardController

  before_filter :authenticate_manager

  def index
    @users = User.all
    @title = 'Manage Users'
  end

  def new
    @fields = [:name,:email,:password,:password_confirmation,:role,:lang]
    @title = 'Manage Users'
  end

  def create
    if params[:new_user] and params[:new_user][:password] == params[:new_user][:password_confirmation]
      User.create!(params[:new_user])
    end
    redirect_to dashboard_users_path
  end

  def destroy
    if User.exists?(params[:id])
      user = User.find(params[:id])
      flash[:notice] = user.name + ' was deleted'
      User.destroy(user.id)
    else
      flash[:notice] = "User doesn't exist"
    end
    redirect_to dashboard_users_path
  end

  def edit
    @fields = [:username,:role,:lang]
    @user_to_edit = User.find_by_id(params[:id])
  end

  def update
    if User.exists?(params[:id])
      user = User.find_by_id(params[:id])
      for field in params[:edit_user].keys
        eval "user.#{field} = params[:edit_user][field]"
      end
      user.save
      flash[:notice] = user.name + ' was updated'
    else
      flash[:notice] = 'user number ' + params[:id].to_s + " doesn't exist"
    end
    redirect_to dashboard_users_path
  end

  def authenticate_manager
    if authenticate_user == 'redirect'
      redirect_to sessions_login_path
    elsif authenticate_user.role.to_sym != :Manager
      redirect_to dashboard_path
    end
  end
  
end
