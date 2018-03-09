require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  context "POST create" do

    it "has a 201 status code" do
      post :create, params: {user: attributes_for(:user), :format => :json }
      expect(response.status).to eq(201)
    end
    it "has a 422 status code" do
        post :create, params: {user: attributes_for(:user, phone_number: nil), :format => :json }
        expect(response.status).to eq(422)
    end
  end

  context "POST login" do
    let(:user) {create(:user)}
    it "has a 200 status code" do
        post :login, params: { phone_number: user.phone_number, password: user.password, :format => :json}
        expect(response.status).to eq(200)
    end
    it "has a 401 status code" do
        post :login, params: { phone_number: user.phone_number, password: "123", :format => :json}
        expect(response.status).to eq(401)
    end
  end
end