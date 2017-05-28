class OrdenavelController < ApplicationController
  helper_method :sort_column, :sort_direction
    
  def index
    objects = controller_name.classify.constantize.order(sort_column + " " + sort_direction).search(params[:search]).paginate(:per_page => 5, :page => params[:page])
    instance_variable_set("@#{controller_name}", objects)
    render 'templates/index', locals:{ colecao: objects}
  end
  
  # GET /pessoas/new
  def new
    instance_variable_set("@#{controller_name.singularize}", controller_name.classify.constantize.new)
    render 'templates/new.js'
  end

  # GET /pessoas/1/edit
  def edit
      instance_variable_set("@#{controller_name.singularize}", controller_name.classify.constantize.find(params[:id]))
      render 'templates/edit.js'
  end
    
  private
    
    def sort_column
      controller_name.classify.constantize.column_names.include?(params[:sort]) ? params[:sort] : "1"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
