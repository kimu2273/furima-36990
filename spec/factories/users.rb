FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'mik000'}
    password_confirmation {password}
    first_name            {Gimei.name.last.kanji}
    last_name             {Gimei.name.first.kanji}
    first_name_kana       {Gimei.name.last.katakana}
    last_name_kana        {Gimei.name.first.katakana}
    birth_day             {Date.new(2000,12,19)}
  end
end
