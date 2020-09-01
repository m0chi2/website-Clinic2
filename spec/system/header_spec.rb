require 'rails_helper'

RSpec.describe "ヘッダーのテスト", type: :request do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end

    context 'ヘッダーの表示を確認' do
      subject { page }

      it 'タイトルロゴが表示される' do
        has_css?("img[src*='toplogo-white.png']")
      end
      it '予約ボタンのテキストが表示される' do
        is_expected.to have_content '簡単web予約をする'
      end
      it 'お問い合わせボタンのテキストが表示される' do
        is_expected.to have_content 'お問い合わせフォーム'
      end
      it '大きな文字メニューのテキストが表示される' do
        is_expected.to have_content '大きな文字でメニューを見る'
      end
      it '医院のご案内のテキストが表示される' do
        is_expected.to have_content '医院のご案内'
      end
      it '診察のご案内のテキストが表示される' do
        is_expected.to have_content '診察のご案内'
      end
      it '交通案内のテキストが表示される' do
        is_expected.to have_content '交通案内'
      end
      it '会員ページのテキストが表示される' do
        is_expected.to have_content '会員ページ'
      end
    end

    context 'ヘッダーのリンクを確認' do
      subject { current_path }

      it 'root画面に遷移する' do
        visit find_all('a')[0][:href]
        is_expected.to eq(root_path)
      end
      it '予約ボタンのリンク先が正しい' do
        reservation_link = find_all('a')[1].native
        expect(reservation_link[:href]).to match("/reservations")
      end
      it '予約画面に遷移する' do
        visit find_all('a')[1][:href]
        expect(page).to have_content '診察予約ページ'
      end
      it 'お問い合わせボタンのリンク先が正しい' do
        inquiry_link = find_all('a')[2].native
        expect(inquiry_link[:href]).to match(inquiry_path)
      end
      it 'お問い合わせ画面に遷移する' do
        visit find_all('a')[2][:href]
        expect(page).to have_content 'お問い合わせ'
      end
      it '大きな文字メニューのリンク先が正しい' do
        menu_link = find_all('a')[3].native
        expect(menu_link[:href]).to eq('#')
      end
      it '大きな文字メニュー画面に遷移する' do
        visit find_all('a')[3][:href]
        expect(page).to have_content 'もとに戻る'
      end
      it '医院のご案内画面に遷移する' do
        visit find_all('a')[4][:href]
        expect(page).to have_content '医院のご案内'
      end
      it '医院のご案内のリンク先が正しい' do
        about_link = find_all('a')[4].native
        expect(about_link[:href]).to match(about_path)
      end
      it '診察のご案内のリンク先が正しい' do
        exam_link = find_all('a')[5].native
        expect(exam_link[:href]).to match(exams_path)
      end
      it '診察のご案内画面に遷移する' do
        visit find_all('a')[5][:href]
        expect(page).to have_content '診察のご案内'
      end
      it '交通案内のリンク先が正しい' do
        access_link = find_all('a')[6].native
        expect(access_link[:href]).to match(access_path)
      end
      it '交通案内画面に遷移する' do
        visit find_all('a')[6][:href]
        expect(page).to have_content '交通案内'
      end
      it '会員ページのリンク先が正しい' do
        patient_session_link = find_all('a')[7].native
        expect(patient_session_link[:href]).to match(new_patient_session_path)
      end
      it '会員ページ画面に遷移する' do
        visit find_all('a')[7][:href]
        expect(page).to have_content '会員ページ'
      end
    end
  end

  describe '会員ログインしている場合' do
    let(:patient) { create(:patient) }

    before do
      visit new_patient_session_path
      fill_in 'patient[email]', with: patient.email
      fill_in 'patient[password]', with: patient.password
      click_button '会員ページへ進む'
    end

    context 'ヘッダーの表示を確認' do
      subject { page }

      it 'タイトルロゴが表示される' do
        has_css?("img[src*='toplogo-white.png']")
      end
      it '大きな文字メニューのテキストが表示される' do
        is_expected.to have_content '大きな文字でメニューを見る'
      end
      it '気になる記録のテキストが表示される' do
        is_expected.to have_content '気になる記録を残す'
      end
      it '予約確認のテキストが表示される' do
        is_expected.to have_content '予約を確認する'
      end
      it '新規予約作成のテキストが表示される' do
        is_expected.to have_content '新規予約作成'
      end
      it 'ログアウトのテキストが表示される' do
        is_expected.to have_content '退出する'
      end
    end

    context 'ヘッダーのリンクを確認' do
      subject { current_path }

      it 'root画面に遷移する' do
        visit find_all('a')[0][:href]
        is_expected.to eq(patients_homes_path)
      end
      it '大きな文字メニューのリンク先が正しい' do
        menu_link = find_all('a')[1].native
        expect(menu_link[:href]).to eq('#')
      end
      it '大きな文字メニュー画面に遷移する' do
        visit find_all('a')[1][:href]
        expect(page).to have_content 'もとに戻る'
      end
      it '気になる記録のリンク先が正しい' do
        post_link = find_all('a')[2].native
        expect(post_link[:href]).to match(posts_path)
      end
      it '気になる記録を残す画面に遷移する' do
        visit find_all('a')[2][:href]
        expect(page).to have_content '気になる記録'
      end
      it '予約確認のリンク先が正しい' do
        patient_reservation_link = find_all('a')[3].native
        expect(patient_reservation_link[:href]).to match(patients_homes_reservation_path)
      end
      it '予約確認画面に遷移する' do
        visit find_all('a')[3][:href]
        expect(page).to have_content '予約一覧'
      end
      it '新規予約作成のリンク先が正しい' do
        reservation_link = find_all('a')[4].native
        expect(reservation_link[:href]).to match(reservations_path)
      end
      it '新規予約作成画面に遷移する' do
        visit find_all('a')[4][:href]
        expect(page).to have_content '診察予約'
      end
      it 'ログアウトのリンク先が正しい' do
        logout_link = find_all('a')[5].native
        expect(logout_link[:href]).to match(destroy_patient_session_path)
      end
      it 'ログアウトする' do
        logout_link = find_all('a')[5].native.inner_text
        logout_link.gsub!(/\t/, '').gsub!(/\n/, '')
        click_link logout_link, match: :first
        is_expected.to eq(root_path)
      end
    end
  end

  describe '管理者ログインしている場合' do
    let(:admin) { create(:admin) }

    before do
      visit new_admin_session_path
      fill_in 'admin[email]', with: admin.email
      fill_in 'admin[password]', with: admin.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      subject { page }

      it 'タイトルロゴが表示される' do
        has_css?("img[src*='toplogo-white.png']")
      end
      it 'ログアウトのテキストが表示される' do
        is_expected.to have_content 'ログアウトする'
      end
      it '大きな文字メニューのテキストが表示される' do
        is_expected.to have_content '大きな文字でメニューを見る'
      end
      it '管理者情報のテキストが表示される' do
        is_expected.to have_content '管理者情報'
      end
      it '会員一覧のテキストが表示される' do
        is_expected.to have_content '会員一覧'
      end
      it '本日の予約一覧のテキストが表示される' do
        is_expected.to have_content '本日の予約一覧'
      end
      it '予約一覧のテキストが表示される' do
        is_expected.to have_content '予約一覧'
      end
    end

    context 'ヘッダーのリンクを確認' do
      subject { current_path }

      it 'root画面に遷移する' do
        visit find_all('a')[0][:href]
        is_expected.to eq(admins_path)
      end
      it 'ログアウトのリンク先が正しい' do
        logout_link = find_all('a')[1].native
        expect(logout_link[:href]).to match(destroy_admin_session_path)
      end
      it 'ログアウトする' do
        admin_logout_link = find_all('a')[1].native.inner_text
        admin_logout_link.gsub!(' ', '').gsub!(/\n/, '')
        click_link admin_logout_link, match: :prefer_exact
        is_expected.to eq(root_path)
      end
      it '大きな文字メニューのリンク先が正しい' do
        menu_link = find_all('a')[2].native
        expect(menu_link[:href]).to match('#')
      end
      it '大きな文字メニュー画面に遷移する' do
        visit find_all('a')[2][:href]
        expect(page).to have_content 'もとに戻る'
      end
      it '管理者情報のリンク先が正しい' do
        post_link = find_all('a')[3].native
        expect(post_link[:href]).to match(admins_about_path)
      end
      it '管理者情報画面に遷移する' do
        visit find_all('a')[3][:href]
        expect(page).to have_content '管理者情報'
      end
      it '会員一覧のリンク先が正しい' do
        patient_reservation_link = find_all('a')[4].native
        expect(patient_reservation_link[:href]).to match(admins_homes_patients_path)
      end
      it '会員一覧画面に遷移する' do
        visit find_all('a')[4][:href]
        expect(page).to have_content '会員一覧'
      end
      it '本日の予約一覧のリンク先が正しい' do
        reservation_link = find_all('a')[5].native
        expect(reservation_link[:href]).to match(admins_reservations_today_path)
      end
      it '本日の予約一覧画面に遷移する' do
        visit find_all('a')[5][:href]
        expect(page).to have_content '本日の予約一覧'
      end
      it '予約一覧のリンク先が正しい' do
        logout_link = find_all('a')[6].native
        expect(logout_link[:href]).to match(admins_reservations_all_path)
      end
      it '予約一覧画面に遷移する' do
        visit find_all('a')[6][:href]
        expect(page).to have_content '予約一覧'
      end
    end
  end
end
