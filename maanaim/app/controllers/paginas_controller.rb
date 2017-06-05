class PaginasController < ApplicationController
  before_action :authenticate_user!
  def inicio
  end

  def ajuda
  end
  
  def lista_eventos
    @eventos = Evento.all
  end
  
end
