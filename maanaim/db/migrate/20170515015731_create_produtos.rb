class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.numeric :preco
      t.boolean :ativo
      t.string :obs

      t.timestamps
    end
  end
end
