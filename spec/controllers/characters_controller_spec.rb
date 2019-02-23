require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  describe '#index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_success
    end

    it 'returns a 200 response' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe '#destroy' do
    context 'as admin' do
      before do
        @admin = User.create(admin: true, email: 'masahide@ishida.com')
        @character = Character.create(name: 'エレン・イェーガー')
      end

      it 'deletes a character' do
        sign_in @admin
        expect do
          delete :destroy, params: { id: @character.id }
        end.to change(Character.all, :count).by(-1)
      end
    end

    # context 'as user' do
    #   before do
    #     @user = User.create(admin: false, email: 'masahide@ishida.com')
    #     @character = Character.create(name: 'エレン・イェーガー')
    #   end
    #
    #   it 'does not delete a character' do
    #     sign_in @user
    #     expect do
    #       delete :destroy, params: { id: @character.id }
    #     end.to_not change(Character.all, :count)
    #   end
    # end
  end
end
