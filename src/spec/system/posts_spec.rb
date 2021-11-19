require 'rails_helper'

RSpec.describe "Posts", type: :system do

  describe "Post CRUD" do
    let!(:user)  { create(:user) }
    let!(:post)  { create(:post) }
    let!(:map)   { create(:map) }
    let!(:photo) { create(:photo) }
    
    before do
     visit new_user_registration_path
     sign_in_as(user)
    end
    
    describe '投稿一覧ページのテスト' do
      describe '投稿のテスト' do
        it '投稿に成功する' do
          fill_in 'address', with: '東京駅'
          click_button '検索'
          fill_in 'post[map_attributes][address]', with: '東京駅'
          fill_in 'post[caption]', with: '東京駅があります。'
          attach_file 'post[photos_attributes][0][image]', Rails.root.join("spec/fixtures/test.png")
          click_button '投稿する'
          expect(current_path).to eq root_path
          expect(page).to have_content '投稿が保存されました'
        end
        it '投稿に失敗する' do
          fill_in 'post[map_attributes][address]', with: nil
          fill_in 'post[caption]', with: '東京駅があります。'
          attach_file 'post[photos_attributes][0][image]', Rails.root.join("spec/fixtures/test.png")
          click_button '投稿する'
          expect(current_path).to eq root_path
          expect(page).to have_content '投稿に失敗しました'
        end
        it '投稿を削除する' do
          click_on 'delete-post-icon'
          expect(page).to have_content "投稿が削除されました"
        end
        context '投稿を編集する' do
          it '投稿編集が成功' do
            click_on 'edit-post-icon'
            fill_in 'post[map_attributes][address]', with: '東京駅'
            fill_in 'post[caption]', with: '東京駅があります。'
            attach_file 'post[photos_attributes][0][image]', Rails.root.join("spec/fixtures/test.png")
            click_on '編集する'
            expect(current_path).to eq root_path
            expect(page).to have_content '投稿が保存されました'
          end
          it '投稿編集が失敗' do
            click_on 'edit-post-icon'
            fill_in 'post[map_attributes][address]', with:  nil
            fill_in 'post[caption]', with: '東京駅があります。'
            attach_file 'post[photos_attributes][0][image]', Rails.root.join("spec/fixtures/test.png")
            click_on '編集する'
            expect(current_path).to eq edit_post_path(post)
            expect(page).to have_content '投稿に失敗しました'
          end
        end
      end
      describe '投稿検索のテスト' do
        it '該当の投稿が表示される' do
          fill_in 'q[user_name_or_map_address_or_caption_cont]', with: '公園'
          click_on '投稿を検索'
          expect(page).to have_content '公園'
        end
      end
    end
  end
end
