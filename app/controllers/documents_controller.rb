class DocumentsController < ApplicationController
  before_filter :authenticate_user, :except => [:index, :show, :new, :create, :text_choice, :new_document_choice]
  before_filter :type_setup, :except => [:dashboard_index, :new_document_choice, :index_by_tag]
  before_filter :dashboard_setup, :only => [:dashboard_index]

  def type_setup
    type = {:binaries => Binary, :pictures => Picture, :sounds => Sound, :texts => Text, :videos => Video}
    @doc_type = type[params[:type].to_sym]
    @doc_type_sym = params[:type].singularize.to_sym
    @langs_sym = (params[:type].singularize + '_langs').to_sym
  end

  def dashboard_setup
    @all_documents = Text.all + Picture.all + Binary.all + Video.all + Sound.all
  end

  def index
    @documents = @doc_type.all
    @permissions = permissions
  end

  def index_by_tag
    if params[:tagid]
      @tag = Tag.find_by_id(params[:tagid])
      @documents = @tag.pictures << @tag.texts << @tag.videos << @tag.sounds << @tag.binaries
      @tags = @tag.children
    else
      not_found
    end
  end

  def show
    @document = @doc_type.find(params[:id])
    @document_langs = @document.send(@langs_sym)
  end

  def new
    @permissions = permissions
    @document = @doc_type.new
    if params[:type] == "texts"
      if params[:subtype] == nil
        redirect_to new_text_choice_path
        return
      end
      @text_subtype = params[:subtype]
      @document.subtype = @subtype
      Text.send(params[:subtype]).each do |field|
        @document.subtype_fields[field] = ""
      end
    end
    document_langs = []
    Item::LANGUAGES.each do |l|
      document_langs.append(@document.send(@langs_sym).build(:lang => l, :status => 'new'))
    end
  end

  def text_choice
  end

  def create
    lang = params[@doc_type_sym][(@langs_sym.to_s + '_attributes').to_sym]
    (0..3).each do |i|
      lang[i.to_s][:status] = 'new'
    end
    @document = @doc_type.new(params[@doc_type_sym])
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document,
                      notice: "#{@doc_type_sym.to_s} was successfully created." }
        format.json { render json: @document, status: :created, location: @document }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @permissions = permissions
    @document = @doc_type.find(params[:id])
    if @document.class == Text
      @text_subtype = @document.subtype
    end
  end

  def update
    @document = @doc_type.find(params[:id])
    respond_to do |format|
      if @document.update_attributes(params[@doc_type_sym])
        format.html { redirect_to @document, 
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
      format.html { redirect_to :controller => "documents", :action => "index", :type => params[:type] } 
      format.json { head :no_content }
    end
  end


  def dashboard_index
    types = [Text, Picture, Binary, Video, Sound]
    if params[:status] == 'all'
      @documents = types.map { |type| type.all }.reduce(:+)
    else
      @documents = types.map { |type| type.where(params[:status].to_sym => true) }.reduce(:+)
    end 
    render 'index'
  end

  def new_document_choice
  end
  def set_new

  end
end
