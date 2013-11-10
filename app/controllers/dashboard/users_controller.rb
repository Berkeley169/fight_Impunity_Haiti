class Dashboard::UsersController < DashboardController

  before_filter :authenticate_manager

  @@self_edit_options = ["edit","update","password_form","update_password"]

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

  def update_user(validate)
    if User.exists?(params[:id])
      user = User.find_by_id(params[:id])
      edit_user(user)
      success = user.save(validate: validate)
      form_submit_message(success,user)
    else
      flash[:notice] = 'user number ' + params[:id].to_s + " doesn't exist"
    end
    sign_in(user, :bypass => true)
    return success
  end

  def password_form
    render 'edit_password' and return
  end

  def update
    update_user(false)
    redirect_user_or_manager
  end

  def update_password
    if params[:edit_user][:password] != params[:edit_user][:password_confirmation]
      flash[:notice] = "passwords don't match"
      password_form
    else
      if update_user(true)
        flash[:notice] = "#{@user.name} password successfully updated"
        redirect_user_or_manager
      else
        password_form
      end
    end
  end

  def redirect_user_or_manager
    if @editing_self and not_manager_or_tech(@user)
      redirect_to dashboard_path
    else
      redirect_to dashboard_users_path
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
    for field in params[:edit_user].keys
      eval "user.#{field} = params[:edit_user][field]"
    end
  end

  def authenticate_manager
    user = authenticate_user
    if not user.is_a? User
      redirect_to new_user_session_path
    elsif editing_self(user)
      @editing_self = true
    elsif not_manager_or_tech(user)
      redirect_to dashboard_path
    end
  end

  def not_manager_or_tech(user)
    user.role.to_sym != :Manager and user.role.to_sym != :Tech
  end

  def editing_self(user)
    @@self_edit_options.include? params[:action] and params[:id].to_i == user.id
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
