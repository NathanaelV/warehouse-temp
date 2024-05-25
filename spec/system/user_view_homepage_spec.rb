require 'rails_helper'

describe "User view homepage" do
  it 'and view application name' do
    visit root_path

    expect(page).to have_content 'Galpões & Estoque'
  end

  it 'view the registered warehouses' do
    Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Av do Porto, 1000',
                      cep: '20000-000', description: 'Galpão do Rio')
    Warehouse.create!(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 40_000, address: 'Av Atlântica, 50',
                      cep: '80000-000', description: 'Perto do Aeroporto')

    visit root_path

    expect(page).to have_content 'Rio'
    expect(page).to have_content 'SDU'
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content '60000 m²'

    expect(page).to have_content 'Maceio'
    expect(page).to have_content 'MCZ'
    expect(page).to have_content 'Maceio'
    expect(page).to have_content '40000 m²'

    expect(page).not_to have_content 'Não existem galpões cadastrados.'
    expect(page).not_to have_content 'Galpão cadastrado com sucesso.'
  end

  it 'there are no registered warehouses' do
    visit root_path

    expect(page).to have_content 'Não existem galpões cadastrados.'
  end
end
