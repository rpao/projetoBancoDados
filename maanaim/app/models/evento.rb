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
  
  attr_reader :total_vendas, :total_recebido, :total_descontos, :total_pendente
  
  def gerar_relatorio
    @total_vendas = 0.0
    self.pedidos.each do |pdd| 
      @total_vendas += pdd.total
    end
    
    @total_recebido = 0.0
    @total_descontos = 0.0
    @total_pendente = 0.0
    
    self.pagamentos.each do |pg|
      @total_recebido += pg.valor
      @total_descontos += pg.desconto
    end
    
    @total_pendente =(@total_recebido + @total_descontos) - @total_vendas
    
  end
  
end
