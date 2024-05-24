require 'rails_helper'

describe 'User register warehouse' do
  it 'from the home screen' do
    visit root_path
    click_on 'Cadastrar Galpão'

    expect(page).to have_field 'Nome', type: 'text'
    expect(page).to have_field 'Descrição', type: 'text'
    expect(page).to have_field 'Código', type: 'text'
    expect(page).to have_field 'Endereço', type: 'text'
    expect(page).to have_field 'Cidade', type: 'text'
    expect(page).to have_field 'CEP', type: 'text'
    expect(page).to have_field 'Área', type: 'text'
  end

  it 'successfully' do
    visit root_path
    click_on 'Cadastrar Galpão'
    fill_in 'Nome', with: 'Aeroporto SP'
    fill_in 'Descrição', with: 'Galpão destinado para cargas internacionais'
    fill_in 'Código', with: 'GRU'
    fill_in 'Endereço', with: 'Avenida do Aeroporto, 1000'
    fill_in 'Cidade', with: 'Guarulhos'
    fill_in 'CEP', with: '15000-000'
    fill_in 'Área', with: '100000'
    click_on 'Criar Galpão'
    
    expect(page).to have_content 'Nome: Aeroporto SP'
    expect(page).to have_content 'Galpão GRU'
    expect(page).to have_content 'Cidade: Guarulhos'
    expect(page).to have_content 'Área: 100000 m²'
    expect(page).to have_content 'Endereço: Avenida do Aeroporto, 1000 CEP: 15000-000'
    expect(page).to have_content 'Galpão destinado para cargas internacionais'
    expect(page).to have_content 'Galpão cadastrado com sucesso'
  end
end
