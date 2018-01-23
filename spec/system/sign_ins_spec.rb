# frozen_string_literal: true

describe 'Sign ins' do
  it 'when user successfully sign ins' do
    create(:user, email: 'me@example.com', password: 'password')

    visit new_sign_in_path

    fill_in 'sign_in[email]', with: 'me@example.com'
    fill_in 'sign_in[password]', with: 'password'
    click_button I18n.t('signin.new.fields.submit')

    expect(current_path).to eq(news_index_path)
  end

  it 'when user successfully sign ins with uppercase email' do
    create(:user, email: 'me@example.com', password: 'password')

    visit new_sign_in_path

    fill_in 'sign_in[email]', with: 'ME@EXAMPLE.COM'
    fill_in 'sign_in[password]', with: 'password'
    click_button I18n.t('signin.new.fields.submit')

    expect(current_path).to eq(news_index_path)
  end

  it 'when user not registered in system' do
    visit new_sign_in_path

    fill_in 'sign_in[email]', with: 'me@example.com'
    fill_in 'sign_in[password]', with: 'password'
    click_button I18n.t('signin.new.fields.submit')

    expect(current_path).to eq(sign_in_path)

    expect(page).to have_content('User with given email not found')
  end

  it 'when user enter wrong password' do
    create(:user, email: 'me@example.com', password: 'password')

    visit new_sign_in_path

    fill_in 'sign_in[email]', with: 'me@example.com'
    fill_in 'sign_in[password]', with: 'wrong-password'
    click_button I18n.t('signin.new.fields.submit')

    expect(current_path).to eq(sign_in_path)

    expect(page).to have_content(I18n.t('validators.password.wrong'))
  end
end
