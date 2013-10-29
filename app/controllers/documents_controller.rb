class DocumentsController < ApplicationController
  before_filter :authenticate_user, :except => [:index, :show, :new, :create]
  before_filter :type_setup

  def type_setup
    type = {:binaries => Binary, :pictures => Picture, :sounds => Sound, :texts => Text, :videos => Video}
    @doc_type = type[params[:type].to_sym]
    if params[:type] == 'binaries'
      @doc_type_sym = :binary
      @langs_sym = 'binary_langs'.to_sym
    else
      @doc_type_sym = params[:type].chomp('s').to_sym
      @langs_sym = (params[:type].chomp('s') + '_langs').to_sym
    end
  end

  def index
    @documents = @doc_type.all
  end

  def show
    @document = @doc_type.find(params[:id])
    @document_langs = @document.send(@langs_sym)
    # This can be further DRYed out at the views level later
    case params[:type]
    when "binaries"
      render :show_binary
    when "pictures"
      render :show_picture
    when "sounds"
      render :show_sound
    when "texts"
      render :show_text
    when "video"
      render :show_video
    end
  end

  def new
    @document = @doc_type.new
    @submit_url = create_document_path(:type => params[:type])
    document_langs = []
    Item::LANGUAGES.each do |l|
      document_langs.append(@document.send(@langs_sym).build(:lang => l))
    end
  end

  def create
    @submit_url = create_document_path(:type => params[:type])
    @document = @doc_type.new(params[@doc_type_sym])
    respond_to do |format|
      if @document.save
        format.html { redirect_to document_path(:type => params[:type],
                                                :id => @document.id), 
                      notice: "#{@doc_type_sym.to_s} was successfully created." }
        format.json { render json: @document, status: :created, location: @document }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @document = @doc_type.find(params[:id])
    @submit_url = update_document_path(:type => params[:type],
                                       :id => @document.id)
  end

  def update
    @document = @doc_type.find(params[:id])
    @submit_url = create_document_path(:type => params[:type])
    respond_to do |format|
      if @document.update_attributes(params[@doc_type_sym])
        format.html { redirect_to document_path(:type => params[:type], 
                                                :id => @document.id),
                      notice: "#{@doc_type_sym.to_s} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document = @doc_type.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_path(:type => params[:type]) }
      format.json { head :no_content }
    end
  end
end
