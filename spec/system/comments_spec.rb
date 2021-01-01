require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @collect = FactoryBot.build(:collect)
  end
  
  context 'コメントができる場合'do
    it 'コメントができる' do
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
      fill_in name="collect[explanation]", with: @collect.explanation
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
      # 詳細画面に遷移する
      click_link '詳細画面'
      # コメントを送信して、保存される
      fill_in name="comment[text]", with: 'コメントの結合テストです'
      find('.btn-success').click
      Comment.count == 1
      # 保存内容が反映される
      expect(page).to have_content('コメントの結合テストです')
    end
  end

  context 'コメントができない場合'do
    it 'コメントが空の場合' do
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
      fill_in name="collect[explanation]", with: @collect.explanation
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
      # 詳細画面に遷移する
      click_link '詳細画面'
      # コメントを送信しても保存されない
      fill_in name="comment[text]", with: ''
      find('.btn-success').click
      Comment.count == 0
    end
  end
end
