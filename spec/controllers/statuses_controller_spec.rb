require "rails_helper"
require 'jwt'

RSpec.describe StatusesController, :type => :controller do
    
    let(:user) {create(:user)}
    let(:user_2) {create(:user, phone_number: "+201100363112")}
    
    let(:token) {JWT.encode({user_id: user.id},Rails.application.secrets.secret_key_base)}
    
    let(:headers) { {"Authorization" => token}}
    let(:headers_2) { {"Authorization" => ""}}    

    context "POST create status" do
        it "has a 201 status code" do
            request.headers.merge! headers            
            post :create, params: {status: attributes_for(:status), phone_number: user.phone_number, :format => :json }
            expect(response.status).to eq(201)
          end
        it "has a 400 status code from wrong mobile number" do
            request.headers.merge! headers            
            post :create, params: {status: attributes_for(:status), phone_number: user_2.phone_number, :format => :json }
            expect(response.status).to eq(400)
        end
        it "has a 400 status code from empty mobile number" do
            request.headers.merge! headers            
            post :create, params: {status: attributes_for(:status), phone_number:"", :format => :json }
            expect(response.status).to eq(400)
        end
        it "has a 401 status code from wrong/empty token" do
            request.headers.merge! headers_2            
            post :create, params: {status: attributes_for(:status), phone_number: user.phone_number, :format => :json }
            expect(response.status).to eq(401)
        end
     end
     
    
end