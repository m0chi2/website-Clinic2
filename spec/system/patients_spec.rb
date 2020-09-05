require 'rails_helper'

module PatientsSpecHelpers
  def select_date(date, options = {})
    name = find('label', text: options[:from])[:for]
    d = date.to_date

    select d.year.to_s,  from: "#{name}_1i"
    select d.month.to_s, from: "#{name}_2i"
    select d.day.to_s,   from: "#{name}_3i"
  end
end

RSpec.configuration.include PatientsSpecHelpers, :type => :request
RSpec.describe "会員のテスト", type: :request do
describe '会員認証のテスト' do
  describe '会員新規登録' do
    before do
      visit new_patient_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'patient[membership_number]', with: '診察券番号'
        fill_in 'patient[name]', with: 'テスト名前'
        fill_in 'patient[name_kana]', with: 'テストナマエ'
        fill_in 'patient[email]', with: 'test@example.com'
        select_date '20180202', from: '生年月日'
        choose 'patient[sex]', with: '2'
        fill_in 'patient[phonenumber]', with: 'phonenumber'
        fill_in 'patient[password]', with: 'password'
        fill_in 'patient[password_confirmation]', with: 'password'
        click_button '登録完了'

        has_content? 'エラー' #確認
        expect(page).to_not eq(new_admin_registration_path)
      end
      it '新規登録に失敗する' do
        fill_in 'patient[name]', with: ''
        fill_in 'patient[email]', with: ''
        fill_in 'patient[password]', with: ''
        fill_in 'patient[password_confirmation]', with: ''
        click_button '登録完了'

        has_content? 'エラー'
        expect(page).to_not eq(new_admin_registration_path)
      end
    end
  end
  describe '会員ログイン' do
    let(:patient) { create(:patient) }
    before do
      visit new_patient_session_path
    end
    context 'ログイン画面に遷移' do
      it 'ログインに成功する' do
        fill_in 'patient[email]', with: patient.email
        fill_in 'patient[password]', with: patient.password
        click_button '会員ページへ進む'

        expect(page).to have_content '会員ページ'
      end

      it 'ログインに失敗する' do
        fill_in 'patient[email]', with: ''
        fill_in 'patient[password]', with: ''
        click_button '会員ページへ進む'

        expect(current_path).to eq(new_patient_session_path)
      end
    end
  end

  describe '会員の予約テスト' do
    let(:patient) { create(:patient) }
    before do
      visit new_patient_session_path
      fill_in 'patient[email]', with: patient.email
      fill_in 'patient[password]', with: patient.password
      click_button '会員ページへ進む'
    end

    describe '予約確認画面のテスト' do
      before do
        visit patients_homes_reservation_path
      end
      context '表示の確認' do
        it '予約一覧と表示される' do
          expect(page).to have_content('予約一覧')
        end
        # it '予約一覧に症状の内容が表示される' do
        #   expect(page).to have_content(reservation.content)
        # end
      end
    end
  end
end
end
