require 'rails_helper'

feature  'User issues contract' do
  scenario 'successfully' do
    category = create(:category)

    price = create(:price, category: category, value: 500, rental_period: 10)

    equipment = create(:equipment, category: category)

    customer = create(:customer)

    contract = build(:contract, customer: customer, discount: 0, start_date: '2017-03-20')

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

    expect(page).to have_content "Valor R$ 500,00"
    expect(page).to have_content "Desconto R$ 0,0"
    expect(page).to have_content "Valor Total R$ 500,00"
    expect(page).to have_content "Forma de Pagamento #{contract.payment_method}"
    expect(page).to have_content "Data de Início 20/03/2017"
    expect(page).to have_content "Data de Devolução 30/03/2017"
    expect(page).to have_content "Responsável #{contract.contact}"
  end

  scenario "and always get the new price" do
    category = create(:category)

    old_price = create(:price, category: category, value: 500, rental_period: 10)
    new_price = create(:price, category: category, value: 700, rental_period: 10)

    equipment = create(:equipment, category: category)

    customer = create(:customer)


    contract = build(:contract, customer: customer, discount: 0, start_date: '2017-03-20')


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
    expect(page).to have_content "Desconto R$ 0,00"
    expect(page).to have_content "Valor Total R$ 700,00"
    expect(page).to have_content "Forma de Pagamento #{contract.payment_method}"
    expect(page).to have_content "Data de Início 20/03/2017"
    expect(page).to have_content "Data de Devolução 30/03/2017"
    expect(page).to have_content "Responsável #{contract.contact}"
  end

  scenario 'and shout fill all fields' do
    visit new_contract_path

    click_on 'Emitir Contrato'

    expect(page).to have_content "Não foi possível emitir contrato."
  end
end
