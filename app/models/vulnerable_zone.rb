class VulnerableZone < ApplicationRecord
  validates :cep, :logradouro, :bairro, :localidade, :uf, presence: true
end
