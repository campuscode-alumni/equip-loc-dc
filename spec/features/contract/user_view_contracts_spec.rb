require 'rails_helper'

feature 'User view contracts' do
  scenario 'successfully' do
    category = Category.create(name: 'Betoneira')

    equipment = Equipment.create(serial_number: 'DAH787D', replacement_value: 50000.00,
                              name: 'Furadeira ASX45', description: 'Impacto 20mm',
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


    contract = Contract.create(customer: customer,
                            delivery_address: 'Avenida Paulista, 900',
                            equipment: equipment,
                            rental_period: '5 dias',
                            amount: 800.00,
                            total_amount: 700.00,
                            discount: 100.00,
                            payment_method: 'à vista',
                            contact: 'Sérgio')
    visit contracts_path

    expect(page).to have_css('h2', text: contract.delivery_address)
    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.contact
  end

  scenario 'and view a list of contracts' do
    category = Category.create(name: 'Betoneira')

    equipment = Equipment.create(serial_number: 'DAH787D', replacement_value: 50000.00,
                              name: 'Furadeira ASX45', description: 'Impacto 20mm',
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

    contract = Contract.create(customer: customer,
                            delivery_address: 'Avenida Paulista, 900',
                            equipment: equipment,
                            rental_period: '5 dias',
                            amount: 800.00,
                            total_amount: 700.00,
                            discount: 100.00,
                            payment_method: 'à vista',
                            contact: 'Sérgio')

    another_contract = Contract.create(customer: customer,
                            delivery_address: 'Rua dos Paulistanos, 100',
                            equipment: 'Furadeira 200 Watts',
                            rental_period: '15 dias',
                            amount: 100.00,
                            total_amount: 200.00,
                            discount: 50.00,
                            payment_method: 'à vista',
                            contact: 'Ronaldo')


    visit contracts_path

    expect(page).to have_css('h2', text: contract.delivery_address)
    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.contact

    expect(page).to have_css('h2', text: another_contract.delivery_address)
    expect(page).to have_content another_contract.customer.name
    expect(page).to have_content another_contract.contact

  end

end
