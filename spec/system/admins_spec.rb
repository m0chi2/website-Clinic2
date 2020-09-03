require 'rails_helper'

RSpec.describe "管理者のテスト", type: :request do
describe '管理者認証のテスト' do
  describe '管理者新規登録' do
    let(:admin) { create(:admin) }
    before do
      visit new_admin_registration_path
    end
    context '管理者画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'admin[email]', with: 'test@example.com'
        fill_in 'admin[password]', with: 'password'
        fill_in 'admin[password_confirmation]', with: 'password'
        click_button 'Sign up'

        has_content? 'エラー'
        expect(page).to have_content '本日の予約は'
      end
    end
  end
  describe '管理者ログイン' do
    let(:admin) { create(:admin) }
    before do
      visit new_admin_session_path
    end
    context 'ログイン画面に遷移' do
      it 'ログインに成功する' do
        fill_in 'admin[email]', with: admin.email
        fill_in 'admin[password]', with: admin.password
        click_button 'ログイン'

        expect(page).to have_content '本日の予約は'
      end

      it 'ログインに失敗する' do
        fill_in 'admin[email]', with: ''
        fill_in 'admin[password]', with: ''
        click_button 'ログイン'

        expect(current_path).not_to eq(admins_path)
      end
    end
  end
end

describe '会員のテスト' do
  let(:patient) { create(:patient) }
  before do
    visit new_patient_session_path
    fill_in 'patient[email]', with: patient.email
    fill_in 'patient[password]', with: patient.password
    click_button '会員ページへ進む'
  end

end
end
