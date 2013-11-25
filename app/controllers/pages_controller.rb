class PagesController < ApplicationController
  def home
  	@tags = Tag.where(:cat => 'main')
  end

  def contact
  end

  def email
  	@name = params[:name]
  	@sub = params[:option]
  	@pnum = params[:phone_number]
  	@body = params[:reason].html_safe
  	@email = params[:email]
  	Notifier.send_contact_request(@sub, @name, @email, @body).deliver
  	flash[:notice] = t(:contact_thanks)
  	redirect_to '/'
  end

  def about
  end

  def donate
  end
end
