class SoundsController < ApplicationController
  before_filter :authenticate_user, :except => [:index, :show, :new, :create]
  def index
    @sounds = Sound.all
  end

  def show
    @sound = Sound.find(params[:id])
    @sound_langs = @sound.sound_langs
  end

  def new
    @sound = Sound.new
    sound_langs = []
    Item::LANGUAGES.each do |l|
      sound_langs.append(@sound.sound_langs.build(:lang => l))
    end
  end

  def create
    @sound = Sound.new(params[:sound])
    respond_to do |format|
      if @sound.save
        format.html { redirect_to @sound, notice: 'Sound was successfully created.' }
  #      format.json { render json: @sound, status: :created, location: @sound }
      else
        format.html { render action: "new" }
        #format.json { render json: @sound.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @sound = Sound.find(params[:id])
  end

  def update
    @sound = Sound.find(params[:id])

    respond_to do |format|
      if @sound.update_attributes(params[:sound])
        format.html { redirect_to @sound, notice: 'Sound was successfully updated.' }
  #      format.json { head :no_content }
      else
        format.html { render action: "edit" }
 #       format.json { render json: @sound.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sound = Sound.find(params[:id])
    @sound.destroy

    respond_to do |format|
      format.html { redirect_to sounds_url }
 #     format.json { head :no_content }
    end
  end
end
