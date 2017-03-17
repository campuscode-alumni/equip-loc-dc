require 'rails_helper'

feature 'User create prices' do
  scenario 'successfully' do

    category = create(:category)

    price = build(:price, category: category)

    visit new_price_path

    fill_in 'Período de Locação', with: price.rental_period
    select category.name, from: 'Tipo de Equipamento'
    fill_in 'Valor', with: price.value

    click_on 'Cadastrar Preço'

    expect(page).to have_content price.rental_period
    expect(page).to have_content price.category.name
    expect(page).to have_content price.value
  end

  scenario 'with invalid data' do

    visit new_price_path

    click_on 'Cadastrar Preço'

    expect(page).to have_content 'Não foi possível cadastrar o preço'
  end

end
