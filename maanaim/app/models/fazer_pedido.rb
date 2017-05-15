class FazerPedido < ApplicationRecord
  belongs_to :evento
  belongs_to :pedido
  belongs_to :conta
end
