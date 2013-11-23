class PagesController < ApplicationController
  def home
  	@tags = Tag.where(:cat => 'main')
  end

  def contact
  end

  def email
  	#@form_data = params[:email]
  	@name = params[:name]
  	@sub = params[:sub]
  	@pnum = params[:phone_number]
  	@body = params[:reason]
  	@email = params[:email]
  	# if params[:reason]
  	# 	redirect_to '/pages/about'
  	# else
  	# 	redirect_to '/'
  	# end
  	Notifier.send_contact_request(@sub).deliver
  	#flash[:notice] = :contact_thanks
  	#redirect_to '/'
  end

  def about
  end
end
