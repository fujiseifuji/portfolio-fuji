require 'rails_helper'

RSpec.describe "Pages", type: :system do
  describe "Page CRUD" do
    let(:user) { create(:user) }

    before do
      visit new_user_registration_path
      sign_in_as(user)
    end

    describe "Pagesのテスト" do
      context "aboutページのテスト" do
        it "アクセスに成功" do
          click_link "ストバスぽっと とは？"
          expect(current_path).to eq pages_about_path
        end
      end
      context "policyページのテスト" do
        it "アクセスに成功" do
          click_link "プライバシーポリシー"
          expect(current_path).to eq pages_policy_path
        end
      end
      context "termsページのテスト" do
        it "アクセスに成功" do
          click_link "利用規約"
          expect(current_path).to eq pages_terms_path
        end
      end
    end
  end
end
