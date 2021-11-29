require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "投稿一覧ページのテスト" do
    let!(:user)  { create(:user) }
    let!(:post)  { create(:post) }
    let!(:map)   { create(:map) }
    let!(:photo) { create(:photo) }

    before do
      get new_user_registration_path
      sign_in user
      get posts_path
    end

    it "投稿一覧ページが開く" do
      expect(response.status).to eq 200
    end

    it "投稿のユーザー名を取得できている" do
      expect(response.body).to include post.user.name
    end

    it "投稿のプロフィール画像を取得できている" do
      expect(response.body).to include post.user.profile_photo_url
    end

    it "投稿のキャプションを取得できている" do
      expect(response.body).to include post.caption
    end

    it "投稿の住所を取得できている" do
      expect(response.body).to include post.map&.address
    end

    it "投稿の画像を取得できている" do
      expect(response.body).to include post.photos.first.image.url
    end

    it "いいね数を取得できている" do
      expect(response.body).to include post.likes.count.to_s
    end
  end
end
