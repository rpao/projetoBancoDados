class LancamentosController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_evento, only: [:index, :destroy, :create, :new, :edit]
  before_action :authenticate_user!
    
  def index
    objects = @evento.send(controller_name).order(sort_column + " " + sort_direction).search(params[:search]).paginate(:per_page => 5, :page => params[:page])
    instance_variable_set("@#{controller_name}", objects)
    render 'lancamentos/index', locals:{ colecao: objects}
  end
  
  def new
    instance_variable_set("@#{controller_name.singularize}", controller_name.classify.constantize.new)
    render 'lancamentos/new.js'
  end

  def edit
      instance_variable_set("@#{controller_name.singularize}", controller_name.classify.constantize.find(params[:id]))
      render 'lancamentos/edit.js'
  end
    
  private
  
    def set_evento
      @evento = Evento.find(params[:evento])
    end
    
    def sort_column
      controller_name.classify.constantize.column_names.include?(params[:sort]) ? params[:sort] : "1"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
