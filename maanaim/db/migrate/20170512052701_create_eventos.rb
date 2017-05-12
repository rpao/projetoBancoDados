class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos do |t|
      t.integer :qtdVagas
      t.datetime :dtInicio
      t.datetime :dtCadastro
      t.datetime :dtFim
      t.references :tipo_eventos, foreign_key: true

      t.timestamps
    end
  end
end
