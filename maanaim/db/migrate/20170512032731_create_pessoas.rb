class CreatePessoas < ActiveRecord::Migration[5.0]
  def change
    create_table :pessoas, id: false do |t|
      t.primary_key :cpf
      t.string :nome
      t.string :sexo
      t.string :logradouro
      t.numeric :cep
      t.string :bairro
      t.string :email
      t.string :telefone
      t.boolean :ativo

      t.timestamps
    end
  end
end
