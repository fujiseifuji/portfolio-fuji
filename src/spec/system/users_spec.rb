require 'rails_helper'

RSpec.describe 'User', type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'User CRUD' do
    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功' do
            visit new_user_registration_path
            fill_in 'user[email]', with: 'test1@example.com'
            fill_in 'user[name]', with: 'testuser'
            attach_file 'user[profile_photo]', Rails.root.join("spec/fixtures/test.png")
            fill_in 'user[password]', with: 'foobar'
            fill_in 'user[password_confirmation]', with: 'foobar'
            click_button '登録する'
            expect(current_path).to eq root_path
            expect(page).to have_content 'アカウント登録が完了しました。'
          end
        end
        context 'メールアドレス未記入' do
          it 'ユーザーの新規作成が失敗' do
            visit new_user_registration_path
            fill_in 'user[email]', with: nil
            fill_in 'user[name]', with: 'testuser'
            attach_file 'user[profile_photo]', Rails.root.join("spec/fixtures/test.png")
            fill_in 'user[password]', with: 'foobar'
            fill_in 'user[password_confirmation]', with: 'foobar'
            click_button '登録する'
            expect(current_path).to eq users_path
            expect(page).to have_content "メールアドレスを入力してください"
          end
        end
        context '登録済メールアドレス' do
          it 'ユーザーの新規作成が失敗する' do
            visit new_user_registration_path
            fill_in 'user[email]', with: user.email
            fill_in 'user[name]', with: 'testuser'
            attach_file 'user[profile_photo]', Rails.root.join("spec/fixtures/test.png")
            fill_in 'user[password]', with: 'foobar'
            fill_in 'user[password_confirmation]', with: 'foobar'
            click_button '登録する'
            expect(current_path).to eq users_path
            expect(page).to have_content "メールアドレスはすでに存在します"
          end
        end
      end
    end
    describe 'ログイン後' do
      before { sign_in_as(user) }
      describe 'ユーザー編集'
      context 'フォームの入力値が正常' do
        it 'ユーザーの編集が成功' do
          visit edit_user_registration_path(user)
          fill_in 'user[name]', with: 'testuser'
          fill_in 'user[email]', with: 'test1@example.com'
          attach_file 'user[profile_photo]', Rails.root.join("spec/fixtures/test.png")
          click_button '変更する'
          expect(current_path).to eq user_path(user)
          expect(page).to have_content 'アカウント情報を変更しました。'
        end
      end
      context 'メールアドレス未記入' do
        it 'ユーザーの編集が失敗' do
          visit edit_user_registration_path(user)
          fill_in 'user[name]', with: 'testuser'
          fill_in 'user[email]', with: nil
          attach_file 'user[profile_photo]', Rails.root.join("spec/fixtures/test.png")
          click_button '変更する'
          expect(current_path).to eq users_path
          expect(page).to have_content "メールアドレスを入力してください"
        end
      end
      it 'ユーザーの削除が成功' do
        visit edit_user_registration_path(user)
        click_link 'アカウントを削除する'
        expect(page).to have_content "アカウント登録もしくはサインインしてください。"
      end
    end
  end
end
