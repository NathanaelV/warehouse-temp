require 'rails_helper'

describe "User view homepage" do
  it 'and view application name' do
    visit root_path

    expect(page).to have_content 'Galpões & Estoque'
  end

  it 'view the registered warehouses' do
    Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000)
    Warehouse.create!(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 40_000)

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
  end

  it 'there are no registered warehouses' do
    visit root_path

    expect(page).to have_content 'Não existem galpões cadastrados.'
  end
end
