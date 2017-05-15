class CreatePagamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :pagamentos do |t|
      t.date :data
      t.belongs_to :conta, foreign_key: true
      t.numeric :valor
      t.numeric :desconto
      t.string :forma_de_pagamento

      t.timestamps
    end
  end
end
