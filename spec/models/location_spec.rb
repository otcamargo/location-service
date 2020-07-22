require 'rails_helper'

RSpec.describe Location, type: :model do
  subject(:location) { locations(:location1) }

  describe 'Validations' do
    it 'is invalid without zip_code' do
      location.zip_code = nil

      expect(location.valid?).to be false
      expect(location.errors[:zip_code]).to include("can't be blank")
    end

    it 'is invalid without street' do
      location.street = nil

      expect(location.valid?).to be false
      expect(location.errors[:street]).to include("can't be blank")
    end

    it 'is invalid without neighborhood' do
      location.neighborhood = nil

      expect(location.valid?).to be false
      expect(location.errors[:neighborhood]).to include("can't be blank")
    end

    it 'is invalid without city' do
      location.city = nil

      expect(location.valid?).to be false
      expect(location.errors[:city]).to include("can't be blank")
    end

    it 'is invalid without state' do
      location.state = nil

      expect(location.valid?).to be false
      expect(location.errors[:state]).to include("can't be blank")
    end
  end
end
