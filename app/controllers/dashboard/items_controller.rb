class Dashboard::ItemsController < DashboardController

  def index
    setup_dashboard
    @title = 'All Documents'
    @Documents = Picture.all + Text.all + Sound.all + Video.all + Binary.all
  end

   	
  def new
  	setup_dashboard
  	@title = "New Documents"
  end

  def inprogress
  end
end