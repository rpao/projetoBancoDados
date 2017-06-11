class CreatePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedidos do |t|
      t.string :obs
      t.belongs_to :conta_evento, foreign_key: true

      t.timestamps
    end
  end
end
