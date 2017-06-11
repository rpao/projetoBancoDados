class ContaEvento < ApplicationRecord
  belongs_to :pessoa
  belongs_to :evento
  has_many :pedidos, dependent: :destroy
  has_many :pagamentos, dependent: :destroy
  
  
  def saldo
    soma = 0.0
    self.pedidos.each { |pp| soma += pp.total }
    pago = 0.0
    self.pedidos.each { |pp| pago += pp.total }
    
  end  
    
  def nome
    self.pessoa.nome
  end
end
