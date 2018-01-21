# frozen_string_literal: true

describe 'Sign ups' do
  it 'when user successfully sign ups' do
    visit new_sign_up_path

    expect {
      fill_in 'sign_up[email]', with: 'me@example.com'
      fill_in 'sign_up[password]', with: 'password'
      fill_in 'sign_up[password_confirmation]', with: 'password'
      click_button 'Sign Up'
    }.to change(User, :count).by(1)

    expect(current_path).to eq(news_index_path)
  end

  it 'when user try use already used email' do
  end
end
