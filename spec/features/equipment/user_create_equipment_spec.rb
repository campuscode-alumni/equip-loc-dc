require 'rails_helper'

feature 'User create equipment' do
  scenario 'successfully' do

    category = Category.create(name: 'Betoneira')

    equipment = Equipment.new(serial_number: 'DAH787D', replacement_value: 50000.00,
                              name: 'Furadeira ASX45', description: 'Impacto 20mm',
                              acquisition_date: '05/01/2017', usage_limit: '2 anos',
                              image: 'http://www.google.com.br', category: category,
                              manufacturer: 'Bosh', supplier: 'Extra')

    visit new_equipment_path

    fill_in 'Número de Série', with: equipment.serial_number
    fill_in 'Valor de Aquisição', with: equipment.replacement_value
    fill_in 'Nome', with: equipment.name
    fill_in 'Descrição', with: equipment.description
    fill_in 'Data de Aquisição', with: equipment.acquisition_date
    fill_in 'Vida Útil', with: equipment.usage_limit
    fill_in 'Foto', with: equipment.image
    select category.name, from: 'Tipo de Equipamento'
    fill_in 'Fabricante', with: equipment.manufacturer
    fill_in 'Fornecedor', with: equipment.supplier

    click_on 'Cadastrar Equipamento'

    expect(page).to have_content equipment.serial_number
    expect(page).to have_content equipment.replacement_value
    expect(page).to have_content equipment.name
    expect(page).to have_content equipment.description
    expect(page).to have_content equipment.acquisition_date
    expect(page).to have_content equipment.usage_limit
    expect(page).to have_content equipment.image
    expect(page).to have_content equipment.category.name
    expect(page).to have_content equipment.manufacturer
    expect(page).to have_content equipment.supplier
  end

  scenario 'with invalid data' do

    visit new_equipment_path

    click_on 'Cadastrar Equipamento'

    expect(page).to have_content 'Não foi possível cadastrar o equipamento'

  end
end
