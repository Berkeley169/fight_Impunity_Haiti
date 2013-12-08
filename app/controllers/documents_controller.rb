class DocumentsController < ApplicationController
  before_filter :authenticate_user, :except => [:index, :show, :new, :create, :text_choice, :new_document_choice]
  before_filter :type_setup, :except => [:dashboard_index, :new_document_choice, :index_by_tag]
  before_filter :dashboard_setup, :only => [:dashboard_index]
  before_filter :sanitize_update, :only => [:update]

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
    if current_user == nil
      @documents = @doc_type.where(:published => true)
    else
      @documents = @doc_type.all
    end
    @permissions = permissions
  end

  def index_by_tag
    if params[:tagid]
      @tag = Tag.find_by_id(params[:tagid])
      
      @documents = @tag.texts << @tag.pictures << @tag.videos << @tag.sounds << @tag.binaries
      @tags = @tag.children
    else
      not_found
    end
  end

  def show
    begin
      @document = @doc_type.find(params[:id])
      if not @document.published and not user_signed_in?
        raise Error
      end
    rescue
      not_found
    end
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
    document_langs = set_langs
  end

  def set_langs
    document_langs = []
    Item::LANGUAGES.each do |l|
      document_langs.append(@document.send(@langs_sym).build(:lang => l.to_s, :status => 'new'))
      # need to also initialize the plain_text of each lang if we are dealing with a text document
      if params[:type] == "texts"
        document_langs.last.plain_text = ""
      end
    end
    return document_langs
  end

  def text_choice
  end

  def create
    set_new_status
    @document = @doc_type.new(params[@doc_type_sym])
    @return_path = return_to_from_create(@document)
    if @document.save
      redirect_to @return_path, notice:"#{@doc_type_sym.to_s} was successfully created."
    else
      if @doc_type_sym == :text
        @text_subtype = params[:text][:subtype]
      end
      render action: "new"
    end
  end

  def set_new_status
    lang = params[@doc_type_sym][(@langs_sym.to_s + '_attributes').to_sym]
    (0..3).each do |i|
      lang[i.to_s][:status] = 'new'
    end
  end

  def return_to_from_create(document)
    if user_signed_in?
      return document
    else
      return method((document.class.to_s.downcase.pluralize + "_path").to_sym).call
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
    if @document.update_attributes(params[@doc_type_sym])
      redirect_to @document, notice: "#{@doc_type_sym.to_s} was successfully updated."
    else
      if @doc_type_sym == :text
        @text_subtype = params[:text][:subtype]
      end
      render action: "edit"
    end
  end

  def sanitize_update
    if current_user.role == "Manager"
      return
    else
      lang_attributes = params[@doc_type_sym][(@langs_sym.to_s + '_attributes').to_sym]
      document = @doc_type.find(params[:id])
      if not assert_valid_meta_data_edit(document, lang_attributes)
        return
      elsif not lang_attributes
        return
      else
        assert_valid_lang_status_edit(document, lang_attributes)
      end
    end
  end

  def destroy
    @document = @doc_type.find(params[:id])
    @document.destroy
    redirect_to :controller => "documents", :action => "index", :type => params[:type]
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
end
