class CreateProdutoPedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :produto_pedidos do |t|
      t.belongs_to :pedido, foreign_key: true
      t.belongs_to :produto, foreign_key: true
      t.integer :quantidade
      t.timestamps
    end
  end
end
