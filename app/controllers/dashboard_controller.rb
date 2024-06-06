class DashboardController < ApplicationController
  def imprese
    @contents = Content.where(tipo: "impresa")
  end

  def progetti
    @impresa = Content.find(params[:id])
    @links = @impresa.linkcontents_as_content_1

  end

  def settimana
  end

  def obiettivo
  end

  def attivit
  end

  def processi
  end

  def todo
  end
end
