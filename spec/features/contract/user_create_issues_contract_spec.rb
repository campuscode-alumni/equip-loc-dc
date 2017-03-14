require 'rails_helper'

feature  'User issues contract' do
  scenario 'successfully' do
    category = create(:category)

    equipment = create(:equipment)

    customer = create(:customer)

    equipment2 = create(:equipment, serial_number: 'DAH787D', replacement_value: 50000.00,
                                name: 'Betoneira', description: 'Impacto 20mm',
                                acquisition_date: '05/01/2017', usage_limit: '2 anos',
                                image: 'http://www.google.com.br', category: category,
                                manufacturer: 'Bosh', supplier: 'Extra')

    contract = build(:contract, customer: customer)

    visit new_contract_path

    select customer.name, from: 'Cliente'
    check(equipment.name)
    check(equipment2.name)
    fill_in 'Prazo de Locação', with: contract.rental_period
    fill_in 'Valor',            with: contract.amount
    fill_in 'Endereço de Entrega', with: contract.delivery_address
    fill_in 'Desconto',         with: contract.discount
    fill_in 'Valor Total',      with: contract.total_amount
    fill_in 'Forma de Pagamento', with: contract.payment_method
    fill_in 'Responsável',        with: contract.contact
    fill_in 'Data de Início',   with: contract.start_date

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
    expect(page).to have_content "Data de Devolução #{contract.start_date + contract.rental_period.to_i.days}"
    expect(page).to have_content "Responsável #{contract.contact}"
  end

  scenario 'and shout fill all fields' do
    visit new_contract_path

    click_on 'Emitir Contrato'

    expect(page).to have_content "Não foi possível emitir contrato."
  end
end
