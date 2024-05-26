require 'rails_helper'

describe 'User edit Warehouse' do
  it 'from homepage' do
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar Galpão'

    expect(page).to have_content 'Editar Aeroporto SP'
    expect(page).to have_field 'Nome', type: 'text', with: 'Aeroporto SP'
    expect(page).to have_field 'Código', type: 'text', with: 'GRU'
    expect(page).to have_field 'Cidade', type: 'text', with: 'Guarulhos'
    expect(page).to have_field 'Área', type: 'text', with: '100000'
    expect(page).to have_field 'Endereço', type: 'text', with: 'Avenida do Aeroporto, 1000'
    expect(page).to have_field 'CEP', type: 'text', with: '15000-000'
    expect(page).to have_field 'Descrição', type: 'text', with: 'Galpão destinado para cargas internacionais'
    expect(page).not_to have_content 'Atente-se aos erros abaixo:'
  end

  it 'successfully' do
    Warehouse.create!(name: 'Rio', code: 'RIO', city: 'Rio de Janeiro', area: 1000,
                      address: 'Endereço no Rio de Janeiro, S/N', cep: '25000-000', description: 'Alguma descrição')

    visit root_path
    click_on 'Rio'
    click_on 'Editar Galpão'
    fill_in 'Nome', with: 'Aeroporto SP'
    fill_in 'Código', with: 'GRU'
    fill_in 'Cidade', with: 'Guarulhos'
    fill_in 'Área', with: '100000'
    fill_in 'Endereço', with: 'Avenida do Aeroporto, 1000'
    fill_in 'CEP', with: '15000-000'
    fill_in 'Descrição', with: 'Galpão destinado para cargas internacionais'
    click_on 'Atualizar Galpão'

    expect(page).to have_content 'Nome: Aeroporto SP'
    expect(page).to have_content 'Galpão GRU'
    expect(page).to have_content 'Cidade: Guarulhos'
    expect(page).to have_content 'Área: 100000 m²'
    expect(page).to have_content 'Endereço: Avenida do Aeroporto, 1000 CEP: 15000-000'
    expect(page).to have_content 'Galpão destinado para cargas internacionais'
    expect(page).to have_content 'Galpão atualizado com sucesso'
    expect(page).not_to have_content 'Atente-se aos erros abaixo'
  end

  it 'with invalid values' do
    Warehouse.create!(name: 'Rio', code: 'RIO', city: 'Rio de Janeiro', area: 1000,
                      address: 'Endereço no Rio de Janeiro, S/N', cep: '25000-000', description: 'Alguma descrição')

    visit root_path
    click_on 'Rio'
    click_on 'Editar Galpão'
    fill_in 'Nome', with: ''
    fill_in 'Código', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'CEP', with: ''
    click_on 'Atualizar Galpão'

    expect(page).to have_content 'Atente-se aos erros abaixo'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'Código não pode ficar em branco'
    expect(page).to have_content 'Cidade não pode ficar em branco'
    expect(page).to have_content 'CEP não pode ficar em branco'
    expect(page).to have_content 'Erro ao atualizar o galpão'
    expect(page).not_to have_content 'Erro ao editar o Galpão'
    expect(page).not_to have_content 'Galpão atualizado com sucesso'
  end

  it 'and return to Warehouse' do
    warehouse = Warehouse.create!(name: 'Rio', code: 'RIO', city: 'Rio de Janeiro', area: 1000,
                                  address: 'Endereço no Rio de Janeiro, S/N', cep: '25000-000',
                                  description: 'Alguma descrição')

    visit root_path
    click_on 'Rio'
    click_on 'Editar Galpão'
    click_on 'Voltar para Rio'

    expect(current_path).to eq warehouse_path(warehouse)
  end
end
