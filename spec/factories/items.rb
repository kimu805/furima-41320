FactoryBot.define do
  factory :item do
    name              {"オムライス"}
    description       {"おふくろのオムライス"}
    category_id       {"2"}
    condition_id      {"2"}
    shipping_pay_id   {"2"}
    prefecture_id     {"2"}
    shipping_time_id  {"2"}
    price             {"1000"}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open("public/images/test_image.png"), filename: "test_image.png")
    end
  end
end
