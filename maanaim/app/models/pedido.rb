class Pedido < ApplicationRecord
  
  belongs_to :conta_evento
  has_many :produto_pedidos, dependent: :destroy
  
  def total
    soma = 0.0
    self.produto_pedidos.each { |pp| soma += pp.produto.preco*pp.quantidade }
    return soma
  end
  
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
