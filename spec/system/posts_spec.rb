require 'rails_helper'

RSpec.describe "投稿管理", type: :system do
  describe "一覧表示" do
    
    let(:user_a) {FactoryBot.build(:user)}
    let!(:post_a) {FactoryBot.build(:post, user: user_a)}

    before do
      visit login_path
      fill_in "Email", with: login_user.email
      fill_in "Password", with: login_user.password
      click_button "Save Session"
    end

    context "ユーザAがログインしている場合" do
      let!(:login_user) {user_a}

      it "ユーザAが作成した投稿表示" do
        expect(page).to have_content post_a.name
      end
    end

  end
end
