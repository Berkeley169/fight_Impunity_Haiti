class PictureLangsController < ApplicationController
  # GET /picture_langs
  # GET /picture_langs.json
  def index
    @picture_langs = PictureLang.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @picture_langs }
    end
  end

  # GET /picture_langs/1
  # GET /picture_langs/1.json
  def show
    @picture_lang = PictureLang.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture_lang }
    end
  end

  # GET /picture_langs/new
  # GET /picture_langs/new.json
  def new
    @picture_lang = PictureLang.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture_lang }
    end
  end

  # GET /picture_langs/1/edit
  def edit
    @picture_lang = PictureLang.find(params[:id])
  end

  # POST /picture_langs
  # POST /picture_langs.json
  def create
    @picture_lang = PictureLang.new(params[:picture_lang])

    respond_to do |format|
      if @picture_lang.save
        format.html { redirect_to @picture_lang, notice: 'Picture lang was successfully created.' }
        format.json { render json: @picture_lang, status: :created, location: @picture_lang }
      else
        format.html { render action: "new" }
        format.json { render json: @picture_lang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /picture_langs/1
  # PUT /picture_langs/1.json
  def update
    @picture_lang = PictureLang.find(params[:id])

    respond_to do |format|
      if @picture_lang.update_attributes(params[:picture_lang])
        format.html { redirect_to @picture_lang, notice: 'Picture lang was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture_lang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picture_langs/1
  # DELETE /picture_langs/1.json
  def destroy
    @picture_lang = PictureLang.find(params[:id])
    @picture_lang.destroy

    respond_to do |format|
      format.html { redirect_to picture_langs_url }
      format.json { head :no_content }
    end
  end
end
