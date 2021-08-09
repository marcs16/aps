require 'rails_helper'

RSpec.describe Language, type: :model do

  context 'validation test' do
    it "Should save successfully" do
      language = Language.all.last
      language2 = Language.new(abbreviation: language.abbreviation, description: language.description).save
      expect(language2).to eq(true)
    end
  end
end
