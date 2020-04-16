require 'rails_helper'

RSpec.describe VulnerableZone, type: :model do
  subject(:vulnerable_zone) { vulnerable_zones(:vulnerable_zone1) }

  describe 'Validations' do
    it 'is invalid without cep' do
      vulnerable_zone.cep = nil

      expect(vulnerable_zone.valid?).to be false
      expect(vulnerable_zone.errors[:cep]).to include("can't be blank")
    end
  end
end
