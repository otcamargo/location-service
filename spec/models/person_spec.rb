require 'rails_helper'

RSpec.describe Person, type: :model do
  subject(:person) { people(:person1) }

  describe 'Validations' do

    it 'is invalid without nome' do
      person.nome = nil

      expect(person.valid?).to be false
      expect(person.errors[:nome]).to include("can't be blank")
    end

    it 'is invalid without email' do
      person.email = nil

      expect(person.valid?).to be false
      expect(person.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without cep' do
      person.cep = nil

      expect(person.valid?).to be false
      expect(person.errors[:cep]).to include("can't be blank")
    end

    it 'is invalid without logradouro' do
      person.logradouro = nil

      expect(person.valid?).to be false
      expect(person.errors[:logradouro]).to include("can't be blank")
    end

    it 'is invalid without bairro' do
      person.bairro = nil

      expect(person.valid?).to be false
      expect(person.errors[:bairro]).to include("can't be blank")
    end

    it 'is invalid without localidade' do
      person.localidade = nil

      expect(person.valid?).to be false
      expect(person.errors[:localidade]).to include("can't be blank")
    end

    it 'is invalid without uf' do
      person.uf = nil

      expect(person.valid?).to be false
      expect(person.errors[:uf]).to include("can't be blank")
    end
  end
end
