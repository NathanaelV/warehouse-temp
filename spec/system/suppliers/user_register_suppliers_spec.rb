require 'rails_helper'

describe 'User register suppliers' do
  it 'from homepage' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'

    expect(page).to have_field 'Nome fantasia'  , type: 'text'
    expect(page).to have_field 'Razão social'   , type: 'text'
    expect(page).to have_field 'CNPJ'           , type: 'text'
    expect(page).to have_field 'Endereço'       , type: 'text'
    expect(page).to have_field 'Cidade'         , type: 'text'
    expect(page).to have_field 'Estado'         , type: 'text'
    expect(page).to have_field 'E-mail'         , type: 'text'
    expect(page).to have_button 'Criar Fornecedor'
    expect(page).not_to have_content 'Atente-se aos erros abaixo:'
  end

  it 'successfully' do
    visit root_path
    click_on 'Fornecedor'
    click_on 'Cadastrar Fornecedor'
    fill_in 'Nome fantasia' , with: 'ACME'
    fill_in 'Razão social'  , with: 'ACME LTDA'
    fill_in 'CNPJ'          , with: '434472216000123'
    fill_in 'Endereço'      , with: 'Av das Palmas, 100'
    fill_in 'Cidade'        , with: 'Bauru'
    fill_in 'Estado'        , with: 'SP'
    fill_in 'E-mail'        , with: 'contato@acme.com.br'
    click_on 'Criar Fornecedor'

    expect(page).to have_content 'ACME LTDA'
    expect(page).to have_content 'CNPJ: 434472216000123'
    expect(page).to have_content 'Endereço: Av das Palmas, 100 - Bauru - SP'
    expect(page).to have_content 'E-mail: contato@acme.com'
    expect(page).to have_content 'Fornecedor cadastrado com sucesso'
  end

  it 'with incomplete fields' do
    visit root_path
    click_on 'Fornecedor'
    click_on 'Cadastrar Fornecedor'
    fill_in 'Nome fantasia' , with: ''
    click_on 'Criar Fornecedor'

    expect(page).to have_content 'Atente-se aos erros abaixo:'
    expect(page).to have_content 'Nome fantasia não pode ficar em branco'
    expect(page).to have_content 'Razão social não pode ficar em branco'
    expect(page).to have_content 'Endereço não pode ficar em branco'
    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Erro ao cadastrar Fornecedor'
  end

  it 'return to Supplier' do
    visit root_path
    click_on 'Fornecedor'
    click_on 'Cadastrar Fornecedor'
    click_on 'Voltar para Fornecedores'
    
    expect(current_path).to eq suppliers_path
  end

  it 'flash message only on new view' do
    visit root_path
    click_on 'Fornecedor'
    click_on 'Cadastrar Fornecedor'
    fill_in 'Nome fantasia' , with: ''
    click_on 'Criar Fornecedor'
    visit root_path
    
    expect(page).not_to have_content 'Erro ao cadastrar Fornecedor'
  end
end
