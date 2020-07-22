require 'rails_helper'

RSpec.describe Location, type: :model do
  subject(:location) { locations(:location1) }

  describe 'Validations' do
    it 'is invalid without cep' do
      location.cep = nil

      expect(location.valid?).to be false
      expect(location.errors[:cep]).to include("can't be blank")
    end

    it 'is invalid without logradouro' do
      location.logradouro = nil

      expect(location.valid?).to be false
      expect(location.errors[:logradouro]).to include("can't be blank")
    end

    it 'is invalid without bairro' do
      location.bairro = nil

      expect(location.valid?).to be false
      expect(location.errors[:bairro]).to include("can't be blank")
    end

    it 'is invalid without localidade' do
      location.localidade = nil

      expect(location.valid?).to be false
      expect(location.errors[:localidade]).to include("can't be blank")
    end

    it 'is invalid without uf' do
      location.uf = nil

      expect(location.valid?).to be false
      expect(location.errors[:uf]).to include("can't be blank")
    end
  end
end
