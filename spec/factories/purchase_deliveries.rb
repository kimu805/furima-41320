FactoryBot.define do
  factory :purchase_delivery do
    post_code {"111-1111"}
    prefecture_id {2}
    municipal {"渋谷区"}
    street {"道玄坂"}
    building {"渋谷109"}
    call {"09012345678"}
  end
end
