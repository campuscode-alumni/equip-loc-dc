FactoryGirl.define do
  factory :contract do
    customer
    delivery_address "Avenida Paulista, 900"
    equipment "Furadeira"
    rental_period "10 dias"
    amount 3000.00
    total_amount 1000.00
    discount 500.00
    payment_method 'a prazo'
    contact "Fabio"
  end
end
