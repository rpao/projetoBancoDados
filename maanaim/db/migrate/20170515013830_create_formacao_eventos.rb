class CreateFormacaoEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :formacao_eventos do |t|
      t.date :data
      t.belongs_to :equipe, foreign_key: true
      t.belongs_to :evento, foreign_key: true
      t.belongs_to :pessoa, foreign_key: true

      t.timestamps
    end
    #add_foreign_key :formacao_eventos, :pessoas, primary_key: 'cpf'
  end
end
