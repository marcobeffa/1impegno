class ContentsController < ApplicationController
  before_action :authenticate_user!, except: %i[ show ]
  before_action :set_content, only: %i[ show edit update destroy ]
  before_action :edit_auth, only: %i[ edit update destroy ]
  before_action :show_auth, only: %i[ show ]
  
  # GET /contents or /contents.json
  def index
    if params[:tipo]
    
      @contents = current_user.contents.where(tipo:  params[:tipo])
    else
      @contents = current_user.contents
    end
 
   
    if !user_signed_in?
      redirect_to root_path
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

    respond_to do |format|
      if @content.save
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
    respond_to do |format|
      if @content.update(content_params)
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
      params.require(:content).permit(:data, :tipo, :nome, :descrizione, :body, :img_url, :email, :telefono, :costo, :ricavo, :user_id, :visibility, :energy, :importanza )
    end
    
    def show_auth
      if !@content.pubblico?
        unless current_user.id == @content.user.id 
          redirect_to root_path
        end
      end
    end

    def edit_auth
     
        unless current_user.id == @content.user.id 
          redirect_to root_path
        end
   
    end

end
