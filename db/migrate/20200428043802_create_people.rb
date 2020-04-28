class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :nome
      t.string :email
      t.string :cep
      t.string :logradouro
      t.string :bairro
      t.string :localidade
      t.string :uf

      t.timestamps
    end
  end
end
