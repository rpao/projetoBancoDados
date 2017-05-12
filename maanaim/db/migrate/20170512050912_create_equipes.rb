class CreateEquipes < ActiveRecord::Migration[5.0]
  def change
    create_table :equipes do |t|
      t.string :nome
      t.string :tipo
      t.datetime :dtCadastro

      t.timestamps
    end
  end
end
