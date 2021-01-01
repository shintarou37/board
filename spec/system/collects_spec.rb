require 'rails_helper'

RSpec.describe 'Collects', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @collect = FactoryBot.build(:collect)
  end
  context '募集の投稿ができる場合' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('掲示板へ')
      # 投稿ページに移動する
      visit new_collect_path
      # フォームに情報を入力する
      fill_in name = 'collect[explanation]', with: @collect.explanation
      select 'Webアプリ開発', from: '作りたいもの(必須)'
      select 'PHP', from: '募集する習得言語、技能(必須)'
      select 'WEBデザイナー', from: '募集するエンジニアの種類(必須)'
      select 'Ruby on Rails', from: '開発フレームワーク(必須)'
      # 送信するとcollectモデルのカウントが1上がることを確認する
      find('.btn-primary').click
      Collect.count == 1
      # 元の画面に戻っていることを確認する
      expect(current_path).to eq new_collect_path
      # 投稿した内容があることを確認する
      expect(page).to have_content('Webアプリ開発')
      expect(page).to have_content('PHP')
      expect(page).to have_content('WEBデザイナー')
      expect(page).to have_content('Ruby on Rails')
    end
  end
  context '投稿ができないとき' do
    it 'ログインしていないと投稿することができない' do
      # トップページに遷移する
      visit root_path
      # 掲示板へ遷移するボタンをクリック
      find('.btn-primary').click
      # 掲示板へ遷移する
      expect(current_path).to eq new_collect_path
      # 投稿するボタンがなく、ログインボタンのみがある
      expect(page).to have_content('ログイン')
      expect(page).to have_no_content('投稿する')
      expect(page).to have_no_content('検索する')
    end
    it '投稿内容を誤ると投稿できない' do
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('掲示板へ')
      # 投稿ページに移動する
      visit new_collect_path
      # フォームに情報を入力する
      fill_in name = 'collect[explanation]', with: ''
      select '--', from: '作りたいもの(必須)'
      select '--', from: '募集する習得言語、技能(必須)'
      select '--', from: '募集するエンジニアの種類(必須)'
      select '--', from: '開発フレームワーク(必須)'
      # 送信ボタンをクリックしても保存されない
      find('.btn-primary').click
      Collect.count == 0
    end
  end
end
