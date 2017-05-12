class CreateTipoEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_eventos do |t|
      t.string :nome
      t.boolean :ativo
      t.datetime :dtCadastro

      t.timestamps
    end
  end
end
