require 'rails_helper'

module ReservationsSpecHelpers
  def select_date(date, options = {})
    name = find('label', text: options[:from])[:for]
    d = date.to_date

    select d.year.to_s,  from: "#{name}_1i"
    select d.month.to_s, from: "#{name}_2i"
    select d.day.to_s,   from: "#{name}_3i"
  end
end

RSpec.configuration.include ReservationsSpecHelpers, :type => :request
RSpec.describe "予約のテスト", type: :request do
  describe 'ログインしていない場合' do
  	context '予約ページが正しく表示される' do
  		now = Date.today
	  	tomorrow = now.tomorrow
  		before do
  			visit reservations_path
  		end
  	describe '表示の確認' do
	  	it '診察予約ページと表示される' do
	  		expect(page).to have_content '診察予約ページ'
	  	end
	  	it '予約希望日フォームが表示される' do
	  		expect(page).to have_field 'pickadate[date]'
	  	end
	  	it '予約希望時間フォームが表示される' do
	  		expect(page).to have_field 'pickadate[time]'
	  	end
	  	it '投稿画面2ページ目に遷移できる' do
	  		fill_in 'pickadate[date]', with: '#{tomorrow}'
	  		fill_in 'pickadate[time]', with: '9:00'
	  		click_button '次へ進む'
	  		expect(page).to have_content '情報入力'
	    end
	    it '投稿画面3ページ目に遷移できる' do
	    	fill_in 'pickadate[date]', with: '#{tomorrow}'
	  		fill_in 'pickadate[time]', with: '9:00'
	  		click_button '次へ進む'
	  		fill_in 'reservation[name]', with: 'テスト太郎'
	  		fill_in 'reservation[name_kana]', with: 'テストタロウ'
	  		select_date '20150505', from: '生年月日'
	  		choose 'reservation[sex]', with: '1'
	  		fill_in 'reservation[phonenumber]', with: '12345678'
	  		fill_in 'reservation[email]', with: 'abc@test.com', match: :first
	  		fill_in 'reservation[exam_content]', with: 'テストテスト'
	  		choose 'reservation[bothering_start_id]', with: '2'
	  		fill_in 'reservation[question_medical_history]', with: 'テストテスト'
	  		click_button '同意して次へ'
	  		expect(page).to have_content 'ご予約の確認'
		end
	  	it '投稿に成功する' do
	  		fill_in 'pickadate[date]', with: '#{tomorrow}'
	  		fill_in 'pickadate[time]', with: '9:00'
	  		click_button '次へ進む'
	  		fill_in 'reservation[name]', with: 'テスト太郎'
	  		fill_in 'reservation[name_kana]', with: 'テストタロウ'
	  		select_date '20150505', from: '生年月日'
	  		choose 'reservation[sex]', with: '1'
	  		fill_in 'reservation[phonenumber]', with: '12345678'
	  		fill_in 'reservation[email]', with: 'abc@test.com', match: :first
	  		fill_in 'reservation[exam_content]', with: 'テストテスト'
	  		choose 'reservation[bothering_start_id]', with: '2'
	  		fill_in 'reservation[question_medical_history]', with: 'テストテスト'
	  		click_button '同意して次へ'
	  		click_link '予約を確定する'
	  		expect(page).not_to have_content 'error'
	  	end
  	end
    end
  end

  describe '会員ログインした場合' do
  	context '予約ページが正しく表示される' do
  		now = Date.today
	  	tomorrow = now.tomorrow
	  	let!(:patient) { create(:patient) }
  		before do
  			visit new_patient_session_path
	        fill_in 'patient[email]', with: patient.email
	        fill_in 'patient[password]', with: patient.password
	        click_button '会員ページへ進む'
  			visit reservations_path
  		end
  	describe '表示の確認' do
	  	it '診察予約ページと表示される' do
	  		expect(page).to have_content '診察予約ページ'
	  	end
	  	it '予約希望日フォームが表示される' do
	  		expect(page).to have_field 'pickadate[date]'
	  	end
	  	it '予約希望時間フォームが表示される' do
	  		expect(page).to have_field 'pickadate[time]'
	  	end
	  	it '投稿画面2ページ目に遷移できる' do
	  		fill_in 'pickadate[date]', with: '#{tomorrow}'
	  		fill_in 'pickadate[time]', with: '9:00'
	  		click_button '次へ進む'
	  		expect(page).to have_content '情報入力'
	  		expect(page).not_to have_content '患者様情報'
	    end
	    it '投稿画面3ページ目に遷移できる' do
	    	fill_in 'pickadate[date]', with: '#{tomorrow}'
	  		fill_in 'pickadate[time]', with: '9:00'
	  		click_button '次へ進む'
	  		fill_in 'reservation[exam_content]', with: 'テストテスト'
	  		choose 'reservation[bothering_start_id]', with: '2'
	  		fill_in 'reservation[question_medical_history]', with: 'テストテスト'
	  		click_button '同意して次へ'
	  		expect(page).to have_content 'ご予約の確認'
		end
	  	it '投稿に成功する' do
	  		fill_in 'pickadate[date]', with: '#{tomorrow}'
	  		fill_in 'pickadate[time]', with: '9:00'
	  		click_button '次へ進む'
	  		fill_in 'reservation[exam_content]', with: 'テストテスト'
	  		choose 'reservation[bothering_start_id]', with: '2'
	  		fill_in 'reservation[question_medical_history]', with: 'テストテスト'
	  		click_button '同意して次へ'
	  		click_link '予約を確定する'
	  		expect(page).not_to have_content 'error'
	  	end
  	end
    end
  end
end
