require 'rails_helper'

feature 'User views contracts for today' do

  scenario 'successfully' do

    category = create(:category)

    price = create(:price, rental_period: 2, category: category)

    equipment = create(:equipment, name: 'Caminhão', category: category)

    another_equipment = create(:equipment, name: 'Escavadeira', category: category)

    customer = create(:customer, name: 'Maria')

    contract = create(:contract, customer: customer, start_date: Date.today,
                      rental_period: price.rental_period,
                      equipment: [equipment, another_equipment])

    another_contract = create(:contract, customer: customer,
                              start_date: Date.today.weeks_ago(2),
                              rental_period: price.rental_period,
                              equipment: [equipment, another_equipment])

    visit root_path

    within('.contracts-for-today') do
      expect(page).to have_css('h3', text: 'Iniciam hoje')
      expect(page).to have_content contract.customer.name
      expect(page).to have_content contract.delivery_address
      expect(page).to have_content contract.equipment.count

      expect(page).to have_content another_contract.customer.name
      expect(page).to have_content another_contract.delivery_address
      expect(page).to have_content another_contract.equipment.count
    end
  end
end
