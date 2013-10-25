class TagsController < ApplicationController
  # GET /tags
  # GET /tags.json
  before_filter :authenticate_user

  def index
    @tags = Tag.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tags }
    end
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /tags/new
  # GET /tags/new.json
  def new
    if current_user.role == "Manager"
      @tag = Tag.new
      mains = Tag.where(:cat => "main")
      @main_categories = [["",nil]]
      mains.each do |m|
        @main_categories << [m.english, m.id]
      end
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @tag }
      end
    else
      flash[:alert] = "you must be logged in as a manager to make new tags"
      redirect_to tags_path
    end
  end

  # GET /tags/1/edit
  def edit
    if current_user.role == "Manager"
      @tag = Tag.find(params[:id])
      mains = Tag.where(:cat => "main")
      @main_categories = [["",nil]]
      mains.each do |m|
        @main_categories << [m.english, m.id]
      end
    else
      flash[:alert] = "you must be logged in as a manager to edit a tag"
      redirect_to tags_path
    end
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(params[:tag])
    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render json: @tag, status: :created, location: @tag }
      else
        format.html { render action: "new" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.json
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end
end
