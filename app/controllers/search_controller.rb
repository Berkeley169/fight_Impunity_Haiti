class SearchController < ApplicationController
  def index
    @results = PgSearch.multisearch(params[:search])
  end

end
