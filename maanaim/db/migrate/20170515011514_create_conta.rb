class CreateConta < ActiveRecord::Migration[5.0]
  def change
    create_table :conta do |t|
      t.numeric :valor
      t.string :sitiacao
      t.string :pessoa_id

      t.timestamps
    end
    add_foreign_key :conta, :pessoas, primary_key: 'cpf'
  end
  
  
end
