FactoryBot.define do
  factory :review do
    rate { 1 }
    review { "MyText" }
    references { "" }
    references { "" }
  end
end
