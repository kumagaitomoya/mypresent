FactoryBot.define do
  factory :message do
    photo_name                  { 'テスト' }
    photo_message               { 'テストです' }
    
    association :user
  

    after(:build) do |message|
      message.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end

end 
end
