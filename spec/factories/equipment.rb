FactoryGirl.define do
  factory :equipment do
    name "Furadeira ASX45"
    serial_number 'DAH787D'
    replacement_value 50000.00
    description 'Impacto 20mm'
    acquisition_date '05/01/2017'
    usage_limit '2 anos'
    image 'http://www.google.com.br'
    category
    manufacturer 'Bosh'
    supplier 'Extra'
  end
end
