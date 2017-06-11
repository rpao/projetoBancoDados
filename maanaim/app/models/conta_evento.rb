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
    
  def nome
    self.pessoa.nome
  end
  
  def label
    nome + "  Saldo- " + ActionController::Base.helpers.number_to_currency(saldo, :separator => ",", :delimiter => ".", :unit => "R$")
  end
  
end
