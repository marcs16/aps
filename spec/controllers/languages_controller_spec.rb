require 'rails_helper'

RSpec.describe LanguagesController, type: :controller do
    it 'validates permission' do
        lang_params = {
            language: {
            abbreviatn: 'fr',
            descritin: 'frances'
            }
            
        }
        should permit(:abbreviation, :description).
        for(:create, params: {language: {
            abbreviatn: 'fr',
            descritin: 'frances'
            }}).on(:language)
        
    end

    describe "Language #create" do
        it "returns http success" do
            lang_params = {
                language: {
                abbreviation: 'fr',
                descrition: 'frances'
                }
            }
            post :create, params: lang_params
            expect(response).to have_http_status(:success)
        end
    end
end
