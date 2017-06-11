class CreateContaEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :conta_eventos do |t|
      t.belongs_to :pessoa, foreign_key: true
      t.belongs_to :evento, foreign_key: true
      t.boolean :em_aberto

      t.timestamps
    end
  end
end
