require 'rails_helper'
feature 'User view contract details' do
  scenario 'successfully' do
    category = create(:category)

    price = create(:price, category: category, value: 700, rental_period: 10)

    equipment = create(:equipment, category: category)

    customer = create(:customer)

    contract = create(:contract, customer: customer, discount: 0,
    start_date: '2017-03-20', rental_period: 10, equipment: [equipment])

    visit contracts_path

    click_on "Avenida Paulista, 900"

    expect(page).to have_css('h2', text: contract.delivery_address)
    expect(page).to have_content contract.customer.name
    expect(page).to have_content equipment.name
    expect(page).to have_content contract.rental_period
    expect(page).to have_content "Valor R$ 700,00"
    expect(page).to have_content "Desconto R$ 0,00"
    expect(page).to have_content "Valor Total R$ 700,00"
    expect(page).to have_content contract.payment_method
    expect(page).to have_content "20/03/2017"
    expect(page).to have_content "30/03/2017"
    #expect(page).to not have_content contract.issue_date
    expect(page).to have_content contract.contact
  end

  scenario 'and return to contract' do
    category = create(:category)

    price = create(:price, category: category, value: 700, rental_period: 10)

    equipment = create(:equipment, category: category)

    customer = create(:customer)

    contract = create(:contract, customer: customer, discount: 0,
    start_date: '2017-03-20', rental_period: 10, equipment: [equipment])

    visit contract_path(contract)

    click_on 'Voltar'

    expect(current_path).to eq(contracts_path)
  end
end
