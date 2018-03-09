require 'faker'

FactoryBot.define do
    factory :user do
        first_name { Faker::Name.first_name }
        last_name  { Faker::Name.last_name }
        avatar Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/my_files/index.png')))
        country_code "US"
        phone_number "+201100363111"#{Faker::Base.numerify('+2###########')}
        gender "male" 
        birth_date "1992-05-20"
        password "P@ssword"
    end
end