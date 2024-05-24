require 'rails_helper'

describe "User view homepage" do
  it 'and view application name' do
    visit root_path

    expect(page).to have_content 'Galpões & Estoque'
  end
end
