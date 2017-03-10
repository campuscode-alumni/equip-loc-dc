require 'rails_helper'

feature  'User issues contract' do
  scenario 'successfully' do
    category = create(:category)

    price = create(:price, category: category, value: 500)

    equipment = create(:equipment, category: category)

    customer = create(:customer)

    contract = build(:contract, customer: customer)

    contract.equipment << equipment

    visit new_contract_path

    select customer.name, from: 'Cliente'

    check(equipment.name)

    select price.rental_period

    fill_in 'Endereço de Entrega', with: contract.delivery_address
    fill_in 'Desconto',         with: contract.discount
    fill_in 'Forma de Pagamento', with: contract.payment_method
    fill_in 'Responsável',        with: contract.contact
    fill_in 'Data de Início',   with: '2017-02-22'
    fill_in 'Data de Devolução', with: '2017-02-27'

    click_on 'Emitir Contrato'

    expect(page).to have_content "Cliente #{contract.customer.name}"
    expect(page).to have_content "Endereço de Entrega #{contract.delivery_address}"
    expect(page).to have_content "Equipamentos #{equipment.name} #{equipment2.name}"
    expect(page).to have_content "Prazo de Locação #{contract.rental_period}"
    expect(page).to have_content "Valor #{contract.amount}"
    expect(page).to have_content "Desconto #{contract.discount}"
    expect(page).to have_content "Valor Total #{contract.total_amount}"
    expect(page).to have_content "Forma de Pagamento #{contract.payment_method}"
    expect(page).to have_content "Data de Início #{contract.start_date}"
    expect(page).to have_content "Data de Devolução #{contract.end_date}"
    expect(page).to have_content "Responsável #{contract.contact}"
  end

  scenario 'and shout fill all fields' do
    visit new_contract_path

    click_on 'Emitir Contrato'

    expect(page).to have_content "Não foi possível emitir contrato."
  end
end
