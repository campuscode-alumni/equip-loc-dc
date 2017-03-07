require 'rails_helper'

feature  'User issues contract' do
  scenario 'successfully' do
<<<<<<< HEAD
    category = Category.create(name: 'Betoneira')
    
=======
    category = Category.create(name: 'Furadeiras')

>>>>>>> b750a6b8cfa54e682d91015260b8e71544570bc6
    equipment = Equipment.create(serial_number: 'DAH787D', replacement_value: 50000.00,
                              name: 'Furadeira ASX45', description: 'Impacto 20mm',
                              acquisition_date: '05/01/2017', usage_limit: '2 anos',
                              image: 'http://www.google.com.br', category: category,
                              manufacturer: 'Bosh', supplier: 'Extra')

<<<<<<< HEAD
    equipment2 = Equipment.create(serial_number: 'DAH787D', replacement_value: 50000.00,
                                name: 'Betoneira', description: 'Impacto 20mm',
                                acquisition_date: '05/01/2017', usage_limit: '2 anos',
                                image: 'http://www.google.com.br', category: category,
                                manufacturer: 'Bosh', supplier: 'Extra')

    customer = Customer.create(name:'João Dias',
                            legal_name:'Grupo Votorantim LTDA.',
                            customer_type:'PJ',
                            contact_name:'José Batista',
                            phone_number:'(011)6573-3030',
                            email:'contato@grupovotorantim.com',
                            address:'Av. Paulista, 326',
                            document: '23.653.876/0001-29')


    contract = Contract.new(customer: customer,
=======
    contract = Contract.new(customer: 'Rafael',
>>>>>>> b750a6b8cfa54e682d91015260b8e71544570bc6
                            delivery_address: 'Avenida Paulista, 900',
                            equipment: equipment,
                            rental_period: '5 dias',
                            amount: 800.00,
                            total_amount: 700.00,
                            discount: 100.00,
                            payment_method: 'à vista',
                            contact: 'Sérgio'
                            )




    visit new_contract_path

    select customer.name, from: 'Cliente'
    fill_in 'Endereço de Entrega',    with: contract.delivery_address
<<<<<<< HEAD
    check(equipment.name)
    check(equipment2.name)

=======
    fill_in 'Equipamento',          with: contract.equipment.name
>>>>>>> b750a6b8cfa54e682d91015260b8e71544570bc6
    fill_in 'Prazo de Locação', with: contract.rental_period
    fill_in 'Valor',            with: contract.amount
    fill_in 'Desconto',         with: contract.discount
    fill_in 'Valor Total',      with: contract.total_amount
    fill_in 'Forma de Pagamento', with: contract.payment_method
    fill_in 'Responsável',        with: contract.contact
    fill_in 'Data de Início',   with: '2017-02-22'
    fill_in 'Data de Devolução', with: '2017-02-27'

    click_on 'Emitir Contrato'

    expect(page).to have_content "Cliente #{contract.customer.name}"
    expect(page).to have_content "Endereço de Entrega #{contract.delivery_address}"
<<<<<<< HEAD
    expect(page).to have_content "Equipamentos #{equipment.name} #{equipment2.name}"
=======
    expect(page).to have_content "Equipamento #{contract.equipment.name}"
>>>>>>> b750a6b8cfa54e682d91015260b8e71544570bc6
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
