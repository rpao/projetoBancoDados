class ContaEvento < ApplicationRecord
  belongs_to :pessoa
  belongs_to :evento
  has_many :pedidos, dependent: :destroy
  has_many :pagamentos, dependent: :destroy
  
  
  def saldo
    soma = 0.0
    self.pedidos.each { |pp| soma += pp.total }
    pago = 0.0
    self.pagamentos.each { |pp| pago += pp.total }
    soma - pago
  end  
  
  def pago 
    pago = 0.0
    self.pagamentos.each { |pp| pago += pp.valor }
    pago
  end
  
  def desconto
    desc = 0.0
    self.pagamentos.each { |pp| desc += pp.desconto }
    desc
  end
  
  def comprado
    soma = 0.0
    self.pedidos.each { |pp| soma += pp.total }
    soma
  end
    
  def nome
    self.pessoa.nome
  end
  
  def label
    nome + "  Saldo- " + ActionController::Base.helpers.number_to_currency(saldo, :separator => ",", :delimiter => ".", :unit => "R$")
  end
  
end
