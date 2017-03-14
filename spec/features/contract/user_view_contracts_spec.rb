
require 'rails_helper'

feature 'User view contracts' do
  scenario 'successfully' do
    category = create(:category)

    equipment = create(:equipment)

    customer = create(:customer)

    contract = create(:contract)

    visit contracts_path

    expect(page).to have_css('h2', text: contract.delivery_address)
    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.contact
  end

  scenario 'and view a list of contracts' do
    category = create(:category)

    equipment = create(:equipment)

    customer = create(:customer)

    contract = create(:contract)

    another_contract = Contract.create(customer: customer,
                            delivery_address: 'Rua dos Paulistanos, 100',
                            rental_period: '15 dias',
                            amount: 100.00,
                            total_amount: 200.00,
                            discount: 50.00,
                            payment_method: 'à vista',
                            contact: 'Ronaldo',
                            start_date: '2017-02-22')


    visit contracts_path

    expect(page).to have_css('h2', text: contract.delivery_address)
    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.contact

    expect(page).to have_css('h2', text: another_contract.delivery_address)
    expect(page).to have_content another_contract.customer.name
    expect(page).to have_content another_contract.contact

  end

end
