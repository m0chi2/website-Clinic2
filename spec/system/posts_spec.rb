require 'rails_helper'

RSpec.describe "posts", type: :request do
  describe '気になる投稿のテスト' do
    context "新規投稿ページが正しく表示される" do
      let!(:patient) { create(:patient) }
      let!(:bothering_start) { create(:bothering_start) }
      let!(:bothering_genre) { create(:bothering_genre) }
      let!(:post) { create(:post, patient: patient) }

      before do
        visit new_patient_session_path
        fill_in 'patient[email]', with: patient.email
        fill_in 'patient[password]', with: patient.password
        click_button '会員ページへ進む'
        visit new_post_path
      end

      describe '表示の確認' do
        it '気になる記録と表示される' do
          expect(page).to have_content '気になる記録'
        end
        it '日時フォームが表示される' do
          expect(page).to have_field 'post[bothering_start_id]'
        end
        it '分類フォームが表示される' do
          expect(page).to have_field 'post[bothering_genre_id]'
        end
        it '詳細内容フォームが表示される' do
          expect(page).to have_field 'post[content]'
        end
        it '記録ボタンが表示される' do
          expect(page).to have_button '記録する'
        end
        it '投稿に成功する' do
          select 'テスト日時', from: '日時'
          select 'テストジャンル', from: '分類'
          fill_in 'post[content]', with: "test"
          click_button '記録する'
        end
        # it '投稿に失敗する' do
        #   click_button '記録する'
        #   expect(page).to have_content 'error'
        #   expect(current_path).to eq('/posts/new')
        # end
      end
    end
  end
end
