require 'rails_helper'

RSpec.describe Status, :type => :model do
    context "creating objects " do
        
        it "creates a valid factory" do
            expect(create(:status)).to be_valid
        end

        it "does not save invalid records" do
            expect(build(:status, status: nil)).not_to be_valid
        end

        it "adds records to database" do
            create(:status)
            expect(Status.count).to eq 1
        end
        
    end


    context "associations" do

        it {is_expected.to belong_to :user}
    end

    context "validations" do
        it {is_expected.to validate_presence_of :status}
        it {is_expected.to validate_presence_of :user_id}
    end

        after(:each) { Status.destroy_all }
    
end