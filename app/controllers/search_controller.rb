class SearchController < ApplicationController
  def index
    @temp = PgSearch.multisearch(params[:search])
    @results = []
    @temp.each do |result|
    	if result.searchable_type.match(/Lang/)
    		main_string = result.searchable_type.gsub("Lang", "")
    		main = main_string.constantize
    		lang = result.searchable_type.constantize.find_by_id(result.searchable_id)
    		main = main.find_by_id(lang.send("#{main_string.downcase}_id".to_sym))
    		@results << main
    	else
    		@results << result
    	end
	end
  end

end
