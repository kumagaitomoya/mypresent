FactoryBot.define do
  factory :user do
    attendance_id         { 2 }
    name                  { '田中太郎' }
    email                 { 'kuma@gmail.com' }
    password              { 'Ab0508' }
    password_confirmation { 'Ab0508' }
    postal_code           { '123-4567' }
    prefecture_id         { 2 }
    municipality          { '横浜市' }
    address               { '青山1-1' }
    building_name         { '東京ハイツ' }
    allergy               { 'チョコレート' }
  end
end
