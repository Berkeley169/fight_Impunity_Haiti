class Dashboard::UsersController < DashboardController

  before_filter :authenticate_manager

  def index
    @users = User.all
    @title = 'Manage Users'
  end

  def new
    @form_type = :new_user
    @url = "/dashboard/users#create"
    @title = 'Add New User'
    @button_text = 'Create New User'
    create_form
  end

  def create
    if params[:new_user] and params[:new_user][:password] == params[:new_user][:password_confirmation]
      user = User.create(params[:new_user])
      if user
        flash[:notice] = "#{user.name} was created"
        redirect_to dashboard_users_path and return
      end
    end
    flash[:notice] = "an error occurred, try again"
    redirect_to new_dashboard_user_path and return
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
    @form_type = :edit_user
    @url = "/dashboard/users/#{params[:id]}/update"
    @user_to_edit = User.find_by_id(params[:id])
    @button_text = 'Save Changes'
    @title = "Edit #{@user_to_edit.name}"
    create_form(true)
  end

  def update
    if User.exists?(params[:id])
      user = User.find_by_id(params[:id])
      for field in params[:edit_user].keys
        eval "user.#{field} = params[:edit_user][field]"
      end
      params[:edit_user].delete(:password)
      params[:edit_user].delete(:password_confirmation)
      if user.save(validate: false)
        flash[:notice] = user.name + ' was updated'
      else
        flash[:notice] = 'an error occured'
      end
    else
      flash[:notice] = 'user number ' + params[:id].to_s + " doesn't exist"
    end
    redirect_to dashboard_users_path
  end

  def authenticate_manager
    user = authenticate_user
    if not user.is_a? User
      redirect_to sessions_login_path
    elsif params[:action] == :edit and params[:id] == user.id
      nil
    elsif user.role.to_sym != :Manager and user.role.to_sym != :Tech
      redirect_to dashboard_path
    end
  end

  def create_form(defaults=false)
    @defaults = {}
    User::REQUIRED_FIELDS.each do |field|
      if field == :lang
        @defaults[field] = {}
        Item::LANGUAGES.each do |lang|
          if defaults
            @defaults[field][lang] = @user_to_edit.lang.to_sym == lang
          else
            @defaults[field][lang] = nil
          end
        end
      elsif field == :role
        @defaults[field] = {}
        User::ROLES.each do |role|
          if defaults
            @defaults[field][role] = @user_to_edit.role.to_sym == role
          else
            @defaults[field][role] = nil
          end
        end
      else
        @defaults[field] = nil
      end
    end
  end
end
