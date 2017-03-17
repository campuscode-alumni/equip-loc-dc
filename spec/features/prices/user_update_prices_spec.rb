require 'rails_helper'
feature 'User update prices' do
  scenario 'Successfully' do

    category = create(:category)

    price = build(:price, category: nil, value: 600)

    price2 = create(:price, category: category)

    visit price_path(price2)

    click_on 'Atualizar Preço'

    fill_in 'Período de Locação', with: 10
    fill_in 'Valor', with: 300

    click_on 'Cadastrar Preço'

    expect(page).to have_content price.rental_period
    expect(page).to have_content category.name
    expect(page).to have_content 300

  end
end
