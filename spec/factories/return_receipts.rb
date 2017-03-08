FactoryGirl.define do
  factory :return_receipt do
    date Date.today
    contract
    document '121212'
    employee_contact 'Maria'
  end
end
