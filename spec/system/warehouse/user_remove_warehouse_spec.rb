require 'rails_helper'

describe 'User remove Warehouse' do
  it 'successfully' do
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Deletar Galpão'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão excluído com sucesso'
    expect(page).not_to have_content 'Aeroporto SP'
    expect(page).not_to have_content 'GRU'
  end

  it 'and does not delte the others' do
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')
                      
    Warehouse.create!(name: 'Rio', code: 'RIO', city: 'Rio de Janeiro', area: 1000,
                      address: 'Endereço no Rio de Janeiro, S/N', cep: '25000-000',
                      description: 'Alguma descrição')

    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Deletar Galpão'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão excluído com sucesso'
    expect(page).to have_content 'Rio'
    expect(page).to have_content 'RIO'
    expect(page).not_to have_content 'Aeroporto SP'
    expect(page).not_to have_content 'GRU'
  end
end
