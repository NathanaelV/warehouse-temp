require 'rails_helper'

describe "User edit supplier" do
  it 'from homepage' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '434472216000123',
                     full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')

    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar ACME'

    expect(page).to have_field 'Nome fantasia', type: 'text'
    expect(page).to have_field 'Razão social' , type: 'text'
    expect(page).to have_field 'CNPJ'         , type: 'text'
    expect(page).to have_field 'Endereço'     , type: 'text'
    expect(page).to have_field 'Cidade'       , type: 'text'
    expect(page).to have_field 'Estado'       , type: 'text'
    expect(page).to have_field 'E-mail'       , type: 'text'
    expect(page).to have_button 'Atualizar Fornecedor'
  end

  it 'successfully' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '434472216000123',
                     full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')

    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar ACME'
    fill_in 'Nome fantasia', with: 'Stark Industries'
    fill_in 'Razão social' , with: 'Stark International LTDA'
    fill_in 'CNPJ'         , with: '60279287182000123'
    fill_in 'Endereço'     , with: 'Torre da Indústria, S/N'
    fill_in 'Cidade'       , with: 'Teresina'
    fill_in 'Estado'       , with: 'PI'
    fill_in 'E-mail'       , with: 'vendedor@stark.com'
    click_on 'Atualizar Fornecedor'

    expect(page).to have_content 'Stark Industries'
    expect(page).to have_content 'Stark International LTDA'
    expect(page).to have_content '60279287182000123'
    expect(page).to have_content 'Endereço: Torre da Indústria, S/N - Teresina - PI'
    expect(page).to have_content 'E-mail: vendedor@stark.com'
    expect(page).to have_content 'Fornecedor atualizado com sucesso'
  end

  xit 'with invalid values' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '434472216000123',
                     full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')

    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar ACME'
    fill_in 'Nome fantasia', with: ''
    fill_in 'CNPJ'         , with: ''
    fill_in 'Estado'       , with: ''
    click_on 'Atualizar Fornecedor'
    
    expect(page).to have_content 'Nome fantasia não pode ficar em branco'
    expect(page).to have_content 'CNPJ não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
    expect(page).to have_content 'Erro ao atualizar Fornecedor'
    expect(page).not_to have_content'Razão social não pode ficar em branco'
    expect(page).not_to have_content'Endereço não pode ficar em branco'
    expect(page).not_to have_content'Cidade não pode ficar em branco'
    expect(page).not_to have_content'E-mail não pode ficar em branco'
  end

  xit 'and return to Supplier' do
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '434472216000123',
                     full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')

    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar ACME'
    click_on 'Voltar para ACME'
    
    expect(page).to eq supplier_path(supplier)
  end

  xit 'flash message only on edit view' do
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '434472216000123',
                     full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')

    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar ACME'
    fill_in 'Estado', with: ''
    click_on 'Atualizar Fornecedor'
    visit root_path
    
    expect(page).not_to have_content 'Erro ao atualizar Fornecedor'
  end
end
