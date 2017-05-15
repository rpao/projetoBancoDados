class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos do |t|
      t.integer :quantidade_de_vagas
      t.date :data_de_inicio
      t.date :data_de_fim
      t.belongs_to :tipo_evento, foreign_key: true

      t.timestamps
    end
  end
end
