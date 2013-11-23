class PagesController < ApplicationController
  def home
  	@tags = Tag.where(:cat => 'main')
  end

  def contact
  end

  def email
  	#@form_data = params
  	# @public_user
  	# @sub
  	#Notifier.send_contact_request(@public_user, @sub).deliver
  	#flash[:notice] = :contact_thanks
  	#redirect_to '/'
  end

  def about
  end
end
