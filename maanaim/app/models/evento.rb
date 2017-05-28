class Evento < ApplicationRecord
  belongs_to :tipo_evento
  
  def self.search(search)
    if search
      where('nome LIKE ?', "%#{search}%")
    else
      where('nome LIKE ?', "%%")
    end
  end
end
