require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "new action" do
    it "should authenticate the user" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should load the page" do
      user = FactoryBot.create(:user)
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "create action" do
    it "should authenticate the user" do
      post :create, params: {
        game: {
          rounds: 9,
          max_player_count: 2
        }
      }
      expect(response).to redirect_to new_user_session_path
    end

    it "should let users start games" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: {
        game: {
          rounds: 9,
          max_player_count: 2
        }
      }
      expect(user.games.count).to eq 1
    end

    it "should only let users make games with valid attributes" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: {
        game: {
          rounds: 0,
          max_player_count: 1
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "show action" do
    it "should authenticate the user" do
      game = FactoryBot.create(:game)
      get :show, params: { id: game.id }
      expect(response).to redirect_to new_user_session_path
    end

    it "should load the page" do
      game = FactoryBot.create(:game)
      user = FactoryBot.create(:user)
      sign_in user
      get :show, params: { id: game.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "destroy action" do
    it "should authenticate the user" do
      game = FactoryBot.create(:game)
      delete :destroy, params: { id: game.id }
      expect(response).to redirect_to new_user_session_path
      expect(Game.all.count).to eq 1
    end

    it "should let users end games" do
      game = FactoryBot.create(:game)
      user = FactoryBot.create(:user)
      sign_in user
      delete :destroy, params: { id: game.id }
      expect(response).to have_http_status(:found)
      expect(Game.all.count).to eq 0
    end
  end
end
