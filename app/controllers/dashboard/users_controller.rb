class Dashboard::UsersController < DashboardController

  def index
    setup_dashboard
    @users = User.all
    @title = 'Manage Users'
  end

  def new
    setup_dashboard
    @fields = [:username,:password,:'re-enter password',:role,:lang]
    @title = 'Manage Users'
  end

  def create
    if params[:new_user] and params[:new_user][:password] == params[:new_user]['re-enter password']
      params[:new_user].delete('re-enter password')
      params[:new_user][:hashed_password] = params[:new_user][:password]
      params[:new_user].delete(:password)
      User.create!(params[:new_user])
    end
    redirect_to dashboard_users_path
  end

  def destroy
    if User.exists?(params[:id])
      user = User.find(params[:id])
      flash[:notice] = user.username + ' was deleted'
      User.destroy(user.id)
    else
      flash[:notice] = "User doesn't exist"
    end
    redirect_to dashboard_users_path
  end

  def edit
    setup_dashboard
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
      flash[:notice] = user.username + ' was updated'
    else
      flash[:notice] = user.username + "doesn't exist"
    end
    redirect_to dashboard_users_path
  end
  
end
