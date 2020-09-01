require 'rails_helper'
RSpec.describe "トップページのテスト", type: :request do
describe 'トップページのテスト' do
  before do
    visit root_path
  end
  describe 'ボディ部分のテスト' do
    context '表示の確認' do
      it 'トップメッセージが表示される' do
        expect(page).to have_selector '.Box__text-topMessages', text: '地域に根差した'
      end
      it '診察日表が表示される' do
        expect(page).to have_content '定休日'
      end
      it 'スクロールボタンが表示される' do
        expect(page).to have_selector '.Btn__scrollDown'
        expect(page).to have_content 'Scroll'
      end
      it 'title 当院の特徴が表示される' do
        expect(page).to have_content '当院の特徴'
      end
      it '詳細ボタンが表示される' do
        expect(page).to have_content 'もっと詳しく'
      end
      it 'title 初めてご来院の方が表示される' do
        expect(page).to have_content '初めてご来院の方'
      end
      it 'title 交通案内が表示される' do
        expect(page).to have_content '交通案内'
      end
      it '最寄りのバス停アイコンが表示される' do
        expect(page).to have_content '最寄りのバス停'
      end
      it '最寄りの駅アイコンが表示される' do
        expect(page).to have_content '最寄りの駅'
      end
    end
    context 'リンクの確認' do
      it 'about 詳細ボタンのリンク先が正しい' do
        btn_more = find_all('#moreBtn1')[0]
        expect(btn_more[:href]).to eq(about_path)
      end
      it 'exams 詳細ボタンのリンク先が正しい' do
        btn_more2 = find_all('#moreBtn2')[1]
        expect(btn_more2[:href]).to eq(exams_path)
      end
      it 'access 詳細ボタンのリンク先が正しい' do
        btn_more3 = find_all('#moreBtn3')[1]
        expect(btn_more3[:href]).to eq(access_path)
      end
    end
  end
end
end