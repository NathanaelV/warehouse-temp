require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid?' do
    it 'presence' do
      supplier = Supplier.new

      supplier.valid?

      expect(supplier.errors.full_messages).to include 'Nome fantasia não pode ficar em branco'
      expect(supplier.errors.full_messages).to include 'Razão social não pode ficar em branco'
      expect(supplier.errors.full_messages).to include 'CNPJ não pode ficar em branco'
      expect(supplier.errors.full_messages).to include 'Endereço não pode ficar em branco'
      expect(supplier.errors.full_messages).to include 'Cidade não pode ficar em branco'
      expect(supplier.errors.full_messages).to include 'Estado não pode ficar em branco'
      expect(supplier.errors.full_messages).to include 'E-mail não pode ficar em branco'
    end
    
    it 'uniqueness' do
      Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '434472216000123',
                       full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')

      supplier = Supplier.new(registration_number: '434472216000123')

      supplier.valid?

      expect(supplier.errors.full_messages).to include 'CNPJ já está em uso'
    end
  end
end
