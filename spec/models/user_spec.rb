require 'rails_helper'

RSpec.describe User, type: :model do
  before(:context) do
    user = User.all.last
    
  end
  context 'validation test' do
    it "Ensures full_name presence" do
      expect(user).to eq(true)
    end

    it "Ensures email presence" do
      expect(user).to eq(true)
    end

    it "Should save successfully" do
      expect(user).to eq(true)
    end
  end

  context "scope test" do

  end
end
