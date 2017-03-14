require 'rails_helper'

feature  'User issues contract' do
  scenario 'successfully' do
    category = create(:category)

    price = create(:price, category: category, value: 500, rental_period: 10)

    equipment = create(:equipment, category: category)

    customer = create(:customer)

    contract = build(:contract, customer: customer, amount: 500, total_amount: 500)

    contract.equipment << equipment

    visit new_contract_path

    select customer.name, from: 'Cliente'

    check(equipment.name)

    select 10, from: 'Prazo de Locação'

    fill_in 'Endereço de Entrega', with: contract.delivery_address
    fill_in 'Desconto',         with: contract.discount
    fill_in 'Forma de Pagamento', with: contract.payment_method
    fill_in 'Responsável',        with: contract.contact
    fill_in 'Data de Início',   with: contract.start_date

    click_on 'Emitir Contrato'

    expect(page).to have_content "Cliente #{contract.customer.name}"
    expect(page).to have_content "Endereço de Entrega #{contract.delivery_address}"
    expect(page).to have_content "Equipamentos #{equipment.name}"
    expect(page).to have_content "Prazo de Locação #{contract.rental_period}"
    expect(page).to have_content "Valor #{contract.amount}"
    expect(page).to have_content "Desconto #{contract.discount}"
    expect(page).to have_content "Valor Total #{contract.total_amount}"
    expect(page).to have_content "Forma de Pagamento #{contract.payment_method}"
    expect(page).to have_content "Data de Início #{contract.start_date}"
    expect(page).to have_content "Data de Devolução #{contract.start_date + contract.rental_period.to_i.days}"
    expect(page).to have_content "Responsável #{contract.contact}"
  end

  scenario 'and shout fill all fields' do
    visit new_contract_path

    click_on 'Emitir Contrato'

    expect(page).to have_content "Não foi possível emitir contrato."
  end
end
