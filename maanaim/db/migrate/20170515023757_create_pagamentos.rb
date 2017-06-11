class CreatePagamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :pagamentos do |t|
      t.date :data
      t.belongs_to :conta_evento, foreign_key: true
      t.numeric :valor, default: 0.0
      t.numeric :desconto, default: 0.0
      t.string :forma_de_pagamento

      t.timestamps
    end
  end
end
