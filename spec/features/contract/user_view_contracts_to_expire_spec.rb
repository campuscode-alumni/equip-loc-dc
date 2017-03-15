require 'rails_helper'

feature 'User view contracts to expire' do

  scenario 'successfully' do

    equipment = create(:equipment)

    customer = create(:customer, name: 'Maria')

    contract = create(:contract, customer: customer, start_date: Date.today, rental_period: '2 dias' )

    contract.equipment << equipment


    another_equipment = create(:equipment)

    another_equipment_2 = create(:equipment)

    other_customer = create(:customer, name: 'José')

    another_contract = create(:contract, customer: other_customer, start_date: Date.today, rental_period: '5 dias', delivery_address: 'Rua Pamplona, 04' )

    another_contract.equipment << another_equipment
    another_contract.equipment << another_equipment_2

    visit root_path

    within('.contracts-to-expire') do
      expect(page).to have_css('h3', text: 'Contratos por vencer')
      expect(page).to have_content contract.customer.name
      expect(page).to have_content contract.delivery_address
      expect(page).to have_content contract.equipment.count

      expect(page).not_to have_content another_contract.customer.name
      expect(page).not_to have_content another_contract.delivery_address
      expect(page).not_to have_content another_contract.equipment.count

    end
  end
end
