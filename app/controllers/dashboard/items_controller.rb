class Dashboard::ItemsController < DashboardController

  def index
    setup_dashboard
    @title = 'All Documents'
  end

   	
  def new
  	setup_dashboard
  	@title = "New Documents"
  end

end