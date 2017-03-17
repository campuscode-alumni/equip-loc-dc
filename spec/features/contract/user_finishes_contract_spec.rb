require 'rails_helper'


feature 'User finish active contract' do

  scenario 'successfully' do
    category = create(:category)
    equipment = create(:equipment, category: category)
    customer = create(:customer)
    price = create(:price, value: 1000, rental_period: 10, category: category)
    contract = create(:contract, equipment: [equipment], customer: customer,  discount: 0, rental_period: price.rental_period)

    travel_to Date.parse('2017-01-01') do
      visit contract_path(contract)

      click_on 'Encerrar Contrato'
    end

    visit contract_path(contract)
    expect(page).to have_content 'Contrato Encerrado em 2017-01-01'

  end


  scenario 'and return to root path' do
    category = create(:category)
    equipment = create(:equipment, category: category)
    customer = create(:customer)
    price = create(:price, value: 1000, rental_period: 10, category: category)
    contract = create(:contract, equipment: [equipment], customer: customer,  discount: 0, rental_period: price.rental_period)

    visit contract_path(contract)

    click_on 'Encerrar Contrato'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Contrato Encerrado'
  end
end
