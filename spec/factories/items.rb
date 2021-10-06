FactoryBot.define do
  factory :item do
    name                  {'test'}
    condition_id          {2}
    category_id           {2}
    explanation           {'test'}
    shipping_area_id      {2}
    shipping_charges_id   {2}
    shipping_days_id      {2}
    price                 {500}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
