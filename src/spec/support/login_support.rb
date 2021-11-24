module LoginSupport
  def sign_in_as(user)
    visit root_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "foobar"
    click_button "ログインする"
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end
