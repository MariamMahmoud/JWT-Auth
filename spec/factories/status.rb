require 'faker'

FactoryBot.define do
    factory :status do
        status {Faker::HarryPotter.quote}
        user 
    end
end