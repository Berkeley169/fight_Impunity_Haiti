class DocumentsController < ApplicationController
  before_filter :authenticate_user, :except => [:index, :show, :new, :create, :text_choice]
  before_filter :type_setup

  def type_setup
    type = {:binaries => Binary, :pictures => Picture, :sounds => Sound, :texts => Text, :videos => Video}
    @doc_type = type[params[:type].to_sym]
    @doc_type_sym = params[:type].singularize.to_sym
    @langs_sym = (params[:type].singularize + '_langs').to_sym
  end

  def index
    @documents = @doc_type.all
  end

  def show
    @document = @doc_type.find(params[:id])
    @document_langs = @document.send(@langs_sym)
    render ('show_' + params[:type].singularize).to_sym
  end

  def new
    @document = @doc_type.new
    if params[:type] == "texts"
      if params[:subtype] == nil
        redirect_to new_text_choice_path
        return
      else
        @text_subtype = params[:subtype]
        @document.subtype = @subtype
        Text.send(params[:subtype]).each do |field|
          @document.subtype_fields[field] = ""
        end
      end
    end
    document_langs = []
    Item::LANGUAGES.each do |l|
      document_langs.append(@document.send(@langs_sym).build(:lang => l))
    end
  end

  def text_choice
  end

  def create
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
end
