require 'rails_helper'

RSpec.describe User, :type => :model do
 
    context "creates valid objects only" do
        it "has a valid factory" do
            expect(create(:user)).to be_valid
        end
        it "is invalid without first name" do
            expect(build(:user, first_name: nil)).not_to be_valid
        end

        it "is invalid without last name"
        it "is invalid without avatar"
        it "is invalid without phone number"
        it "is invalid without birth date"
        it "is invalid without gender"
        it "is invalid with wrong date format"
        it "is invalid with non existing country code"
        it "is invalid with wrong phone number format"
    end
    context "built in validations" do
        # it {is_expected.to validate_presence_of :first_name}
        it "validates birth date format"
        it "validate uniqueness of phone number"
        it "validates uniqueness of auth token"

    end

    context "responds to custom validations" do
        it "responds to phone_number_format" do
            expect(build(:user)).to respond_to(:phone_number_format)
        end
        it "responds to country_code_existance"
        it "responds to birth_date_in_the_past"
    end
end