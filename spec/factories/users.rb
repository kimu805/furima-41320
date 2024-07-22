FactoryBot.define do
  factory :user do
    nickname              {"鈴木まさし"}
    email                 {Faker::Internet.email}
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    last_name_kanji       {"鈴木"}
    first_name_kanji      {"まさし"}
    last_name_kana        {"スズキ"}
    first_name_kana       {"マサシ"}
    birthday              {Faker::Date.between(from: 2.days.ago, to: Date.today)}
  end
end