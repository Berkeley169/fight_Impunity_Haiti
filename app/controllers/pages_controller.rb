class PagesController < ApplicationController

  before_filter :setup_negative_captcha, :only => [:contact, :email]
  before_filter :authenticate_manager, :only => [:index, :edit, :show, :destroy, :new, :create, :update]

  def home
  	@tags = Tag.where(:cat => 'main')
  end

  def contact
    setup_negative_captcha
  end

  def email
    if @captcha.valid?
    	@name = @captcha.values[:name]
    	@sub = params[:option]
    	@pnum = @captcha.values[:phone_number]
    	@body = @captcha.values[:reason].html_safe
    	@email = @captcha.values[:email]
    	Notifier.send_contact_request(@sub, @name, @email, @body, @pnum).deliver
    	flash[:notice] = t(:contact_thanks)
    	redirect_to '/'
    end
  end

  def about
    @page = Page.where(:title => "About").first
  end

  def donate
  end

  def index
    @pages = Page.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  def edit
      @page = Page.find(params[:id])
  end

  def new
      @page = Page.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @page }
      end
  end

  def show
    @page = Page.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  def update
    @page = Page.find(params[:id])
      if @page.update_attributes(params[:page])
        redirect_to @page, notice: 'Page was successfully updated.'
      else
        render action: "edit"
      end
  end

  def create
    @page = Page.new(params[:page])
    #respond_to do |format|
      if @page.save
        redirect_to @page, notice: 'Page was successfully created.'
      else
        render action: "new"
      end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_path }
      format.json { head :no_content }
    end

  end


  private
    def setup_negative_captcha
      @captcha = NegativeCaptcha.new(
        # A secret key entered in environment.rb. 'rake secret' will give you a good one.
        secret: '376bb294da5a17009e64b41b4672cc1f605d444435f63f09b46e959eca298cc10ecf9c9816ae3a6079d33ce87260b2f0825d8fcf44bdd3d1a283347f74019d84',
        spinner: request.remote_ip, 
        # Whatever fields are in your form
        fields: [:name, :phone_number, :subject, :email, :reason],  
        params: params
      )
    end
end
