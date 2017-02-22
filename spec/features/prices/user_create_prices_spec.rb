require 'rails_helper'

feature 'User create prices' do
  scenario 'successfully' do
    price = Price.new(rental_period: 3, category: 'Furadeira', value: 2000.00)

    visit new_price_path

    fill_in 'Período de Locação', with: price.rental_period
    fill_in 'Tipo de Equipamento', with: price.category
    fill_in 'Valor', with: price.value

    click_on 'Cadastrar Preço'

    expect(page).to have_content price.rental_period
    expect(page).to have_content price.category
    expect(page).to have_content price.value
  end

  scenario 'with invalid data' do

    visit new_price_path

    click_on 'Cadastrar Preço'

    expect(page).to have_content 'Não foi possível cadastrar o preço'
  end

end
