require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do
  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前がなければ無効な状態であること" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "メールアドレスがなければ無効な状態であること" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "パスワードがなければ無効な状態であること" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "パスワードとパスワードの確認が一致しなければ無効な状態であること" do
    user = FactoryBot.build(:user, password: 'hogehoge', password_confirmation: 'hogehogehoge')
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end

  it "プロフィール画像がなければ無効な状態であること" do
    user = FactoryBot.build(:user, profile_photo: nil)
    user.valid?
    expect(user.errors[:profile_photo]).to include("を入力してください")
  end

  it "重複したメールアドレスは無効な状態であること" do
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
end
