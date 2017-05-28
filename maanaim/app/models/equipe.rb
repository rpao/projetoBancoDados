class Equipe < ApplicationRecord
    
  def self.search(search)
    if search
      #where('data_de_inicio LIKE ?', "%#{search}%")
      where('true')
    else
      #where('data_de_inicio LIKE ?', "%%")
      where('true')
    end
  end
end
