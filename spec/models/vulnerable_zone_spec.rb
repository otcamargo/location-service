require 'rails_helper'

RSpec.describe VulnerableZone, type: :model do
  subject(:vulnerable_zone) { vulnerable_zones(:vulnerable_zone1) }

  describe 'Validations' do
    it 'is invalid without cep' do
      vulnerable_zone.cep = nil

      expect(vulnerable_zone.valid?).to be false
      expect(vulnerable_zone.errors[:cep]).to include("can't be blank")
    end

    it 'is invalid without logradouro' do
      vulnerable_zone.logradouro = nil

      expect(vulnerable_zone.valid?).to be false
      expect(vulnerable_zone.errors[:logradouro]).to include("can't be blank")
    end

    it 'is invalid without bairro' do
      vulnerable_zone.bairro = nil

      expect(vulnerable_zone.valid?).to be false
      expect(vulnerable_zone.errors[:bairro]).to include("can't be blank")
    end

    it 'is invalid without localidade' do
      vulnerable_zone.localidade = nil

      expect(vulnerable_zone.valid?).to be false
      expect(vulnerable_zone.errors[:localidade]).to include("can't be blank")
    end

    it 'is invalid without uf' do
      vulnerable_zone.uf = nil

      expect(vulnerable_zone.valid?).to be false
      expect(vulnerable_zone.errors[:uf]).to include("can't be blank")
    end
  end
end
