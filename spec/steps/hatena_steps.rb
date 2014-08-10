# encoding: utf-8

step 'はてなのトップページにアクセスする' do
  Capybara.app_host = 'http://www.hatena.ne.jp'
end

step 'トップページを表示する' do
  visit '/'
end

step ':label をクリックする' do |label|
  click_link label
end

step '送信するをクリックする' do
  find('input[type=submit]').click
end

step 'ヘッダの :label をクリックする' do |label|
  within '#header-body' do
    click_link label
  end
end

step '次のアカウント情報を入力する:' do |table|
  table.hashes.each do |hash|
    fill_in 'name',     with: hash['はてなID']
    fill_in 'password', with: hash['パスワード']
  end
end

step ':text が表示されていること' do |text|
  expect(page).to have_content(text)
end

step ':text が表示されていないこと' do |text|
  expect(page).to_not have_content(text)
end
