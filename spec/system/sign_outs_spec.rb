# frozen_string_literal: true

describe 'Sign outs' do
  it 'when user successfully sign outs' do
    create(:user, id: 42)

    page.set_rack_session(user_id: 42)

    visit root_path

    click_link I18n.t('layout.logout')

    # expect {
    #   click_link I18n.t('layout.logout')
    # }.to change { page.get_rack_session_key('user_id') }.from(42).to(nil)

    puts page.get_rack_session

    expect(page.get_rack_session_key(:user_id)).to eq(nil)
  end

  # expect(page.get_rack_session_key('ref')).to eq("123")


  it 'when user not signed in' do
    # visit
  end
end
