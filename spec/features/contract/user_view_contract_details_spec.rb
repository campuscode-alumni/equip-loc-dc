require 'rails_helper'
feature 'User view contract details' do
  scenario 'successfully' do
    category = create(:category)

    equipment = create(:equipment)

    customer = create(:customer)

    contract = create(:contract, amount: 500, total_amount: 1200)

    contract.equipment << equipment

    visit contracts_path

    click_on "Avenida Paulista, 900"

    expect(page).to have_css('h2', text: contract.delivery_address)
    expect(page).to have_content contract.customer.name
    expect(page).to have_content equipment.name
    expect(page).to have_content contract.rental_period
    expect(page).to have_content contract.amount
    expect(page).to have_content contract.discount
    expect(page).to have_content contract.total_amount
    expect(page).to have_content contract.payment_method
    expect(page).to have_content contract.start_date
    expect(page).to have_content contract.end_date
    #expect(page).to not have_content contract.issue_date
    expect(page).to have_content contract.contact
  end

  scenario 'and return to contract' do
    category = create(:category)

    equipment = create(:equipment)

    customer = create(:customer)

    contract = create(:contract, amount: 500, total_amount: 1200)

    visit contract_path(contract)

    click_on 'Voltar'

    expect(current_path).to eq(contracts_path)
  end
end
