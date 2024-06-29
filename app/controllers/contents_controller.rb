class ContentsController < ApplicationController
  include ApplicationHelper
  
  before_action :authenticate_user!, except: %i[ public ]
  before_action :set_content, only: %i[ show edit update destroy public]
  before_action :edit_auth, only: %i[ edit update destroy ]
  before_action :set_public, only: %i[ public ]

  
  # GET /contents or /contents.json
 
  def index  
    
    if !user_signed_in?
      redirect_to root_path
    end

    if params[:tipo]
      @contents = current_user.contents.where(tipo:  params[:tipo])
    elsif params[:query].present?
     # @contents = Content.where("nome LIKE ?", "%#{params[:query]}%")
     @contents = Content.where("lower(nome) LIKE ?", "%#{params[:query].downcase}%") 
    else
      @contents = current_user.contents
    end
  
    if params[:data].nil?
      @data_completa = DateTime.now
      @data =  @data_completa.strftime('%Y-%m-%d')
      @dataform = DateTime.now.strftime('%d-%m-%Y')
    else
      @data = params[:data]  
      begin
        @data_completa = DateTime.strptime(@data, '%Y-%m-%d')
      rescue ArgumentError => e
        flash[:error] = "Data non valida. Utilizzando la data corrente."
        @data_completa = DateTime.now
        @data =  @data_completa.strftime('%Y-%m-%d') 
      end
      @dataform =  @data_completa.strftime('%d-%m-%Y')
    end 
    

    
  
   
   
    
  end

  # GET /contents/1 or /contents/1.json
  def show
  end

  def public
  end
  # GET /contents/new
  def new
    @content = current_user.contents.build
  end

  # GET /contents/1/edit
  def edit
   
  end

  # POST /contents or /contents.json
  def create
    @content = current_user.contents.build(content_params)
    @dash_id = dashidfromday(@content.created_at)
      if @dash_id.nil?
        @dash = Dash.all.last
      else
        @dash = Dash.find(@dash_id)
      end
    respond_to do |format|
      if @content.save
      
        if @content.costo.nil? && @content.costo_eur.present?
          @content.update(costo: (1 / @dash.eur * @content.costo_eur).truncate(4)) 
        end
        if @content.costo_eur.nil? && @content.costo.present?
          @content.update(costo_eur:  (@dash.eur * @content.costo).truncate(2))  
        end
        if @content.ricavo.nil? && @content.ricavo_eur.present?
          @content.update(ricavo:  (1 / @dash.eur * @content.ricavo_eur).truncate(4)) 
        end
        if @content.costo.nil? && @content.costo_eur.present?
          @content.update(ricavo_eur:  (@dash.eur * @content.ricavo).truncate(2))   
        end
        

        format.html { redirect_to content_url(@content), notice: "Content was successfully created." }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1 or /contents/1.json
  def update
    if @content.costo
      @costo = @content.costo
    end
    if @content.costo_eur 
      @costo_eur = @content.costo_eur
    end
    if @content.ricavo
      @ricavo = @content.ricavo
    end
    if @content.ricavo_eur
      @ricavo_eur = @content.ricavo_eur
    end
    @dash_id = dashidfromday(@content.created_at)
    if @dash_id.nil?
      @dash = Dash.all.last
    else
      @dash = Dash.find(@dash_id)
    end
    respond_to do |format|
      if @content.update(content_params)
        if @content.costo != @costo 
          @content.update(costo_eur:  (@dash.eur  * @content.costo).truncate(2))  
        end
        if @content.costo_eur != @costo_eur
          @content.update(costo: ( 1 / @dash.eur * @content.costo_eur).truncate(4)) 
   
        end
        if @content.ricavo != @ricavo
          @content.update(ricavo_eur:  (@dash.eur  * @content.ricavo).truncate(2)) 
        end
        if @content.ricavo_eur != @ricavo_eur
          @content.update(ricavo:  (1 / @dash.eur * @content.ricavo_eur).truncate(4)) 
           
        end
        format.html { redirect_to content_url(@content), notice: "Content was successfully updated." }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1 or /contents/1.json
  def destroy
    @content.destroy!

    respond_to do |format|
      format.html { redirect_to contents_url, notice: "Content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:data, :tipo, :nome, :descrizione, :body, :img_url, :email, :telefono, :costo, :ricavo, :user_id, :visibility, :energy, :importanza, :mermaid, :stato, :costo_eur, :ricavo_eur )
    end
    
    def set_public
      if @content.visibility != "pubblico"

          redirect_to root_path
 
      end
    end

    def edit_auth
        unless current_user.id == @content.user.id 
          redirect_to root_path
        end
    end

    


end
