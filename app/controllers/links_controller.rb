class LinksController < ApplicationController
  def newprogetto
    if params[:impresa_id]
     impresa_id = params[:impresa_id]
    else
      redirect_to root_path
    end
    if params[:nome_progetto]
     nome_progetto = params[:nome_progetto]
    else
      redirect_to root_path
    
    end
    if params[:descrizione_progetto]
      descrizione_progetto = params[:descrizione_progetto]
    else
      redirect_to root_path
    end
    @progetto = Content.create(user_id: current_user.id, tipo: "progetto", nome: nome_progetto, descrizione: descrizione_progetto, data: DateTime.now, visibility: "privato", stato: "nuovo")
    @link= Linkcontent.create(user_id: current_user.id, content_1_id: impresa_id,  content_2_id: @progetto.id ) 
    if !@progetto.nil?
      redirect_to content_path(@progetto.id)
    else
     redirect_to root_path
    end
  end
end

