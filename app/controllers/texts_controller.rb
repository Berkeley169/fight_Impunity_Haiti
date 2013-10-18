class TextsController < ApplicationController
  def index
    @texts = Text.all
  end

  def show
    @text = Text.find(params[:id])
    @text_langs = @text.text_langs
  end

  def new
    @text = Text.new
    text_langs = []
    Item::LANGUAGES.each do |l|
      text_langs.append(@text.text_langs.build(:lang => l))
    end
  end

  def create
    @text = Text.new(params[:text])
    respond_to do |format|
      if @text.save
        format.html { redirect_to @text, notice: 'Text was successfully created.' }
        format.json { render json: @text, status: :created, location: @text }
      else
        format.html { render action: "new" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @text = Text.find(params[:id])
  end

  def update
    @text = Text.find(params[:id])

    respond_to do |format|
      if @text.update_attributes(params[:text])
        format.html { redirect_to @text, notice: 'Text was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @text = Text.find(params[:id])
    @text.destroy

    respond_to do |format|
      format.html { redirect_to texts_url }
      format.json { head :no_content }
    end
  end
end
