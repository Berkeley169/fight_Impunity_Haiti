class Dashboard::ItemsController < DashboardController

  def index
    setup_dashboard
    @title = 'All Documents'
  end

end