require 'rails_helper'

describe "User view supplier" do
  it 'from homepage' do
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end

    expect(current_path).to eq suppliers_path
  end

  it 'successfully' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '434472216000123',
                     full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')
    Supplier.create!(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark',
                     registration_number: '60279287182000123', full_address: 'Torre da Indústria Brasil LTDA',
                     city: 'Teresina', state: 'PI', email: 'vendedor@spark.com.br')

    visit root_path
    click_on 'Fornecedores'

    expect(page).to have_content 'Fornecedores'
    expect(page).to have_content 'ACME'
    expect(page).to have_content 'Bauru - SP'
    expect(page).to have_content 'Spark'
    expect(page).to have_content 'Teresina - PI'
  end
end
