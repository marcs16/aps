require 'rails_helper'

RSpec.describe Language, type: :model do

  context 'validation test' do
    it "Save successfully" do
      language = Language.new(abbreviation: "es", description: "español").save
      expect(language).to eq(true)
    end
    it ""
  end
end
