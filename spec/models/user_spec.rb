require 'rails_helper'

RSpec.describe User, :type => :model do
 
    context "creating objects " do

        it "creates a valid factory" do
            expect(create(:user)).to be_valid
        end

        it "does not save invalid records" do
            expect(build(:user, first_name: nil)).not_to be_valid
        end

        it "adds records to database" do
            create(:user)
            expect(User.count).to eq 1
        end
        
    end

    context "associations" do
        it {is_expected.to have_many :statuses}
    end

    context "validations" do
        it {is_expected.to validate_presence_of :first_name}
        it {is_expected.to validate_presence_of :last_name}
        it {is_expected.to validate_presence_of :password}
        it {is_expected.to validate_presence_of :avatar}
        it {is_expected.to validate_presence_of :phone_number}
        it {is_expected.to validate_presence_of :birth_date}
        it {is_expected.to validate_presence_of :gender}
        it {is_expected.to validate_uniqueness_of :email}
        it {is_expected.to validate_uniqueness_of :phone_number}
        it "is invalid with wrong date format" do
            expect(build(:user, birth_date: "20-05-1992")).not_to be_valid
        end     
        it "is invalid with future date" do
            expect(build(:user, birth_date: "2018-05-20")).not_to be_valid
        end         

        it "is invalid with wrong phone number format" do
            expect(build(:user, phone_number: "00201122000333")).not_to be_valid
        end
        it "is invalid with non existing country code" do
            expect(build(:user, country_code: "NOT Correct")).not_to be_valid
        end
        
    end

    context "responds to methods" do
        it "responds to phone_number_format" do
            expect(build(:user)).to respond_to(:phone_number_format)
        end

        it "responds to birth_date_in_the_past" do
            expect(build(:user)).to respond_to(:birth_date_in_the_past)
        end
        it "responds to country_code_existance" do
            expect(build(:user)).to respond_to(:country_code_existance)
        end            
        
    end

    context "has secure password" do
        it { is_expected.to have_secure_password }
    end

    
    after(:each) { User.destroy_all }
end