class Evento < ApplicationRecord
  belongs_to :tipo_evento
  has_many :conta_eventos, dependent: :destroy
  has_many :pedidos, through: :conta_eventos
  has_many :pagamentos, through: :conta_eventos
  has_many :pessoas, through: :conta_eventos
  def self.search(search)
    if search
      where('nome LIKE ?', "%#{search}%")
    else
      where('true')
    end
  end
end
