class CreateVulnerableZones < ActiveRecord::Migration[6.0]
  def change
    create_table :vulnerable_zones do |t|
      t.string :cep, null: false
      t.string :logradouro, null: false
      t.string :bairro, null: false
      t.string :localidade, null: false
      t.string :uf, null: false

      t.timestamps
    end
  end
end
