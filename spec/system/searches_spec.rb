require 'rails_helper'

RSpec.describe 'Searches', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @collect = FactoryBot.build(:collect)
  end
  context '検索ができる場合' do
    it '検索ができる' do
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
      # 送信する
      find('.btn-primary').click
      # 検索する
      select 'Webアプリ開発', from: '募集の習得言語'
      find('.btn-success').click
      # 検索結果が表示される
      expect(page).to have_content('Webアプリ開発')
      expect(page).to have_content('PHP')
      expect(page).to have_content('掲示板へ')
      expect(page).to have_content('WEBデザイナー')
      expect(page).to have_content('検索結果')
    end
  end

  context '検索する項目がない場合' do
    it '検索項目がない' do
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
      # 送信する
      find('.btn-primary').click
      # 投稿なのい項目を検索
      select 'スマホアプリ開発', from: '募集の習得言語'
      find('.btn-success').click
      # 投稿がないと検索結果が出る
      expect(page).to have_content('該当する募集はありません')
    end
  end
end
