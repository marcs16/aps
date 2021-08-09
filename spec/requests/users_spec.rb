require 'rails_helper'

RSpec.describe "Users", type: :request do
  before(:context) do
    user = User.all.last    
  end
  describe "GET /index" do
    it "returns succes response" do
      get :index
      expect(response).to be_success
    end

    it "returns a success response" do
      user = User.first
      get :show, params: {id: user.id}
      expect(response).to be_success
    end
  end
end
