FactoryGirl.define do
  factory :contract do
    customer
    delivery_address "Avenida Paulista, 900"
    rental_period "10 dias"
    amount 3000.00
    total_amount 1000.00
    discount 500.00
    payment_method 'a prazo'
    contact "Fabio"
    start_date '2017-02-22'

  end
end
