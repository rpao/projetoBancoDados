class Produto < ApplicationRecord
    
  def self.search(search)
    if search
      where('nome LIKE ?', "%#{search}%")
    else
      where('nome LIKE ?', "%%")
    end
  end
end
