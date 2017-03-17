
require 'rails_helper'

feature 'User view contracts' do
  scenario 'successfully' do
    category = create(:category)

    equipment = create(:equipment)

    customer = create(:customer)

    contract = create(:contract, amount: 500, total_amount: 1200)

    visit contracts_path

    expect(page).to have_css('h2', text: contract.delivery_address)
    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.contact
  end

  scenario 'and view a list of contracts' do
    category = create(:category)

    equipment = create(:equipment)

    customer = create(:customer)

    contract = create(:contract, amount: 500, total_amount: 1200)

    another_contract = create(:contract, amount: 600, total_amount: 1500)


    visit contracts_path

    expect(page).to have_css('h2', text: contract.delivery_address)
    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.contact

    expect(page).to have_css('h2', text: another_contract.delivery_address)
    expect(page).to have_content another_contract.customer.name
    expect(page).to have_content another_contract.contact

  end

end
