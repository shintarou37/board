require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @user_detail = FactoryBot.build(:user_detail)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム(必須)', with: @user.nickname
      fill_in 'Eメール(必須)', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード確認用', with: @user.password_confirmation
      # 「次へ」ボタンをクリック
      find('input[name="commit"]').click
      # ２枚目のページに遷移する
      expect(page).to have_content('詳細情報登録(全ての項目がからでも登録できます)')
      # ２回目のユーザー情報を入力する
      fill_in name="user_detail[introduce]", with: @user_detail.introduce
      select '15才', from: '年齢'
      select '北海道', from: '現在住んでいる都道府県'
      select 'WEBデザイナー', from: '自分のエンジニアの種類'
      select 'PHP', from: '習得言語、習得技能'
      select 'Webアプリ開発', from: '作りたい物'
      select '15才', from: '年齢'
      fill_in name="user_detail[GitHub]", with: @user_detail.GitHub
      # 登録ボタンをクリックして保存される
      expect{
      find('input[name="commit"]').click
      }.to change { User.count UserDetail.count }.by(1)
      # トップページに戻る
      expect(current_path).to eq root_path
      # ヘッダーの表示が変更されている
      expect(page).to have_content('ログアウト')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '１ページ目の入力を誤ると新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報で誤った情報を入力するを入力する
      fill_in 'ニックネーム(必須)', with: ''
      fill_in 'Eメール(必須)', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード確認用', with: @user.password_confirmation
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
      find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
end
