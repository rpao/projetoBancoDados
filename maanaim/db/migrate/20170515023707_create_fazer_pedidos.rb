class CreateFazerPedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :fazer_pedidos do |t|
      t.belongs_to :evento, foreign_key: true
      t.belongs_to :pedido, foreign_key: true
      t.belongs_to :account, foreign_key: true

      t.timestamps
    end
  end
end
