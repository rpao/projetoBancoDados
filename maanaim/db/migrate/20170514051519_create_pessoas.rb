class CreatePessoas < ActiveRecord::Migration[5.0]
  def change
    create_table :pessoas, id: false do |t|
      t.string :cpf, primary_key: true
      t.string :nome
      t.string :sexo
      t.datetime :dtNasc
      t.string :logradouro
      t.string :cep
      t.string :bairro
      t.string :email
      t.string :telefone
      t.boolean :ativo

      t.timestamps
    end
  end
end
