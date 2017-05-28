class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.numeric :valor
      t.string :sitiacao
      t.belongs_to :pessoa,  foreign_key: true

      t.timestamps
    end
    #add_foreign_key :accounts, :pessoas, primary_key: 'cpf'
  end
end
