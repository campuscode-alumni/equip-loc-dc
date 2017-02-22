require "rails_helper"
feature "User creates customer" do
  scenario 'successfully' do
    customer = Customer.new(name:'João Dias',
                            legal_name:'Grupo Votorantim LTDA.',
                            customer_type:'PJ',
                            contact_name:'José Batista',
                            phone_number:'(011)6573-3030',
                            email:'contato@grupovotorantim.com',
                            address:'Av. Paulista, 326',
                            document: '23.653.876/0001-29')

  visit new_customer_path

  fill_in 'Nome',               with: customer.name
  fill_in 'Razão Social',       with: customer.legal_name
  fill_in 'Tipo de Cliente',    with: customer.customer_type
  fill_in 'Contato',            with: customer.contact_name
  fill_in 'Telefone',           with: customer.phone_number
  fill_in 'Email',              with: customer.email
  fill_in 'Endereço',           with: customer.address
  fill_in 'CPF/CNPJ',           with: customer.document

  click_on 'Cadastrar Cliente'

  expect(page).to have_css('h1', text: customer.name)
  expect(page).to have_content customer.legal_name
  expect(page).to have_content customer.customer_type
  expect(page).to have_content customer.contact_name
  expect(page).to have_content customer.phone_number
  expect(page).to have_content customer.email
  expect(page).to have_content customer.address
  expect(page).to have_content customer.document
  end
end
