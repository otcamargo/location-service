class Person < ApplicationRecord
  validates :nome, :email, :cep, :logradouro, :bairro, :localidade, :uf, presence: true
  validates :email, uniqueness: true
end
