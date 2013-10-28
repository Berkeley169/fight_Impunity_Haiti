class BinariesController < ApplicationController
  before_filter :authenticate_user, :except => [:index, :show, :new, :create]
  def index
    @binaries = Binary.all
  end

  def show
    @binary = Binary.find(params[:id])
    @binary_langs = @binary.binary_langs
  end

  def new
    @binary = Binary.new
    binary_langs = []
    Item::LANGUAGES.each do |l|
      binary_langs.append(@binary.binary_langs.build(:lang => l))
    end
  end

  def create
    @binary = Binary.new(params[:binary])
    respond_to do |format|
      if @binary.save
        format.html { redirect_to @binary, notice: 'Binary was successfully created.' }
        format.json { render json: @binary, status: :created, location: @binary }
      else
        format.html { render action: "new" }
        format.json { render json: @binary.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @binary = Binary.find(params[:id])
  end

  def update
    @binary = Binary.find(params[:id])

    respond_to do |format|
      if @binary.update_attributes(params[:binary])
        format.html { redirect_to @binary, notice: 'Binary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @binary.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @binary = Binary.find(params[:id])
    @binary.destroy

    respond_to do |format|
      format.html { redirect_to binaries_url }
      format.json { head :no_content }
    end
  end
end
