class PagesController < ApplicationController

  before_filter :setup_negative_captcha, :only => [:contact, :email]

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
  end

  def donate
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
