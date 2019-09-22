FactoryBot.define do
  factory :label do
    title { "MyString" }
    content { "MyText" }
    user { nil }
    task { nil }
  end
end
