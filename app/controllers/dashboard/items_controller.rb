class Dashboard::ItemsController < DashboardController

  TYPES = [Picture, Text, Sound, Video, Binary]
  def index
    setup_dashboard
    @title = 'All Documents'
    @Documents = Picture.all + Text.all + Sound.all + Video.all + Binary.all
  end

  def published
    setup_dashboard
    @title = 'Published Documents'
    @Documents = []
    TYPES.each do |type|
      type.all.each do |doc|
        if !doc.nil? && doc.published?
          @Documents.push(doc)
        end
      end
    end
    render 'index'
  end

  def fresh
    setup_dashboard
    @title = 'New Documents'
    @Documents = []
    TYPES.each do |type|
      type.all.each do |doc|
        if !doc.nil? && !doc.published?
          @Documents.push(doc)
        end
      end
    end
    render 'index'
  end
 	
  def new
  	setup_dashboard
  	@title = "New Documents"
  end

  def inprogress
  end
end
