class PagesController < ApplicationController
  def home
  	@tags = Tag.where(:cat => 'main')
  end

  def contact
  end

  def about
  end

  def donate
  end
end
