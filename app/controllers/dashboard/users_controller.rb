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
    if valid_new_user
      user = User.create(params[:new_user])
      if user
        flash[:notice] = "#{user.name} was created"
        redirect_to dashboard_users_path and return
      end
    end
    flash[:notice] = "an error occurred, try again"
    redirect_to new_dashboard_user_path and return
  end

  def valid_new_user
    params[:new_user] and params[:new_user][:password] == params[:new_user][:password_confirmation]
  end

  def destroy
    if User.exists?(params[:id])
      user = User.find(params[:id])
      if not_self(user)
        flash[:notice] = user.name + ' was deleted'
        User.destroy(user.id)
      end
      redirect_to dashboard_users_path and return
    end
    flash[:notice] = "User doesn't exist"
    redirect_to dashboard_users_path
  end

  def not_self(user)
    if user == @user
      flash[:notice] = 'A user cannot delete themselves'
      return false
    end
    return true
  end

  def edit
    @form_type = :edit_user
    @url = "/dashboard/users/#{params[:id]}/update"
    @user_to_edit = User.find_by_id(params[:id])
    @button_text = 'Save Changes'
    @title = "Edit #{@user_to_edit.first_name} #{@user_to_edit.last_name}"
    create_form(true)
  end

  def update
    if User.exists?(params[:id])
      user = User.find_by_id(params[:id])
      edit_user(user)
      if user.save(validate: false)
        flash[:notice] = user.name + ' was updated'
      else
        flash[:notice] = 'an error occured, please try again'
      end
    else
      flash[:notice] = 'user number ' + params[:id].to_s + " doesn't exist"
    end
    redirect_to dashboard_users_path
  end

  def edit_user(user)
    for field in params[:edit_user].keys
      eval "user.#{field} = params[:edit_user][field]"
    end
  end

  def authenticate_manager
    user = authenticate_user
    if not user.is_a? User
      redirect_to sessions_login_path
    elsif params[:action] == :edit and params[:id] == user.id
      @editing_self = true
    elsif user.role.to_sym != :Manager and user.role.to_sym != :Tech
      redirect_to dashboard_path
    end
  end

  def create_form(defaults=false)
    @defaults = {}
    User::REQUIRED_FIELDS.each do |field|
      if field == :lang
        add_radio_button_defaults(field,Item::LANGUAGES,defaults)
      elsif field == :role
        add_radio_button_defaults(field,User::ROLES,defaults)
      else
        if defaults
          @defaults[field] = eval "@user_to_edit.#{field}"
        else
          @defaults[field] = nil
        end
      end
    end
  end

  def add_radio_button_defaults(field,list,defaults)
    @defaults[field] = {}
    list.each do |radio_field|
      if defaults
        @defaults[field][radio_field] = (eval "@user_to_edit.#{field}.to_sym") == radio_field
      else
        @defaults[field][radio_field] = nil
      end
    end
  end
end
