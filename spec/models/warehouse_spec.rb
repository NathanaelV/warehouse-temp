require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  it 'field cannot be blank' do
    warehouse = Warehouse.new

    warehouse.valid?

    expect(warehouse.errors.full_messages).to include 'Nome não pode ficar em branco'
    expect(warehouse.errors.full_messages).to include 'Código não pode ficar em branco'
    expect(warehouse.errors.full_messages).to include 'Cidade não pode ficar em branco'
    expect(warehouse.errors.full_messages).to include 'Descrição não pode ficar em branco'
    expect(warehouse.errors.full_messages).to include 'Endereço não pode ficar em branco'
    expect(warehouse.errors.full_messages).to include 'CEP não pode ficar em branco'
    expect(warehouse.errors.full_messages).to include 'Área não pode ficar em branco'
  end

  it 'warehouse code needs to be unique' do
    Warehouse.create!(name: 'Rio', code: 'RIO', address: 'Endereço', cep: '25000-000', city: 'Rio',
                      area: 1000, description: 'Alguma descrição')

    warehouse = Warehouse.new(code: 'RIO')

    warehouse.valid?

    expect(warehouse.errors.full_messages).to include 'Código já está em uso'
    expect(warehouse.errors.full_messages).not_to include 'Código não pode ficar em branco'
  end
end
