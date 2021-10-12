FactoryBot.define do
  factory :purchase_information do
    post_code           {'111-1111'}
    city                {'横浜市縁区'}
    address             {'青山1-1-1'}
    shipping_area_id    {2}
    association :item
  end
end
