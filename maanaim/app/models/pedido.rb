class Pedido < ApplicationRecord
  belongs_to :pessoa
  has_many :produto_pedidos
  has_many :pedidos, through: :produto_pedidos
  
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
