require 'rails_helper'
RSpec.describe "お問い合わせのテスト", type: :request do
	describe 'お問い合わせのテスト' do
	  context 'お問い合わせページが正しく表示される'
		before do
			visit inquiry_path
		end
	end
	describe '表示の確認' do
		it 'お問い合わせと表示される' do
			expect(page).to have_content 'お問い合わせ'
		end
		it '名前フォームが表示される' do
			expect(page).to have_field 'inquiry[name]'
		end
		it 'メールアドレスフォームが表示される' do
			expect(page).to have_field 'inquiry[email]'
		end
		it 'お問い合わせ内容フォームが表示される' do
			expect(page).to have_field 'inquiry[message]'
		end
		it '確認ボタンが表示される' do
			expect(page).to have_button '確認'
		end
		it 'お問い合わせ内容の確認ページが表示される' do
			fill_in 'inquiry[name]', with: 'テスト名前'
			fill_in 'inquiry[email]', with: 'test@example.com'
			fill_in 'inquiry[message]', with: 'テストテストテスト'
			click_button '確認'
			expect(page).to eq(inquiry_confirm_path)
		end
	end
	describe '動作の確認' do
		it 'お問い合わせの送信ができる' do
			fill_in 'inquiry[name]', with: 'テスト名前'
			fill_in 'inquiry[email]', with: 'test@example.com'
			fill_in 'inquiry[message]', with: 'テストテストテスト'
			click_button '確認'
			click_button '送信'
		end
		it 'お問い合わせに失敗する' do
			click_button '確認'
			expect(page).to have_content '入力内容にエラーがあります'
		end
	end
end