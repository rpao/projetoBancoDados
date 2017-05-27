class PaginasController < ApplicationController
  before_action :authenticate_user!
  def inicio
  end

  def ajuda
  end
end
