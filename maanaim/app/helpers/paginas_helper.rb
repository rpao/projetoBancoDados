module PaginasHelper
    def nav_gerencia
        
        '<div class="py-5">
            <div class="container">
              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-tabs">
                    <li class="nav-item"> <a href="'+ pessoas_path + '" class="'+ (controller_name == "pessoas" ? "active" : "")  +' nav-link">Clientes</a> </li>
                    <li class="nav-item"> <a href="'+ users_path + '" class="'+ (controller_name == "users" ? "active" : "")  +' nav-link">Vendedor</a> </li>
                    <li class="nav-item"> <a href="'+ equipes_path + '" class="'+ (controller_name == "equipes" ? "active" : "")  +' nav-link">Equipe</a> </li>
                    <li class="nav-item"> <a href="'+ eventos_path + '" class="'+ (controller_name == "eventos" ? "active" : "")  +' nav-link">Evento</a> </li>
                    <li class="nav-item"> <a href="'+ produtos_path + '" class="'+ (controller_name == "produtos" ? "active" : "")  +' nav-link">Produto</a> </li>
                    <li class="nav-item"> <a href="'+ tipo_eventos_path + '" class="'+ (controller_name == "tipo_eventos" ? "active" : "")  +' nav-link">Tipo de evento</a> </li>
                  </ul>
                </div>
              </div>
            </div>
        </div>'
    end
    
    def sortable(column, title = nil)
        title ||= column.titleize
        css_class = column == sort_column ? "current #{sort_direction}" : nil
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        link_to title, params.permit(:sort,:direction,:page).merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
    end
    
    
end


