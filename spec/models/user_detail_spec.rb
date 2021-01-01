require 'rails_helper'

RSpec.describe UserDetail, type: :model do
  before do
    @user_detail = FactoryBot.build(:user_detail)
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が要件を満たしている場合' do
        expect(@user_detail).to be_valid
      end
      it 'GitHubがなくても登録ができる' do
        @user_detail.GitHub = ''
        expect(@user_detail).to be_valid
      end
      it 'introduceがなくても登録ができる' do
        @user_detail.introduce = ''
        expect(@user_detail).to be_valid
      end
      it 'prefecture_idが１でも登録ができる' do
        @user_detail.prefecture_id = '1'
        expect(@user_detail).to be_valid
      end
      it 'age_idが１でも登録ができる' do
        @user_detail.age_id = '1'
        expect(@user_detail).to be_valid
      end
      it 'language_idが１でも登録ができる' do
        @user_detail.language_id = '1'
        expect(@user_detail).to be_valid
      end
      it 'type_idが１でも登録ができる' do
        @user_detail.type_id = '1'
        expect(@user_detail).to be_valid
      end
      it 'goal_idが１でも登録ができる' do
        @user_detail.goal_id = '1'
        expect(@user_detail).to be_valid
      end
    end
    context '新規登録がうまくいかない時' do
      it '自己紹介が1000文字より多い場合' do
        over = Faker::Base.regexify('[aあ]{1001}')
        @user_detail.introduce = over
        @user_detail.valid?
        expect(@user_detail.errors.full_messages).to include('Introduceは1000文字以内で入力してください')
      end
      it 'GitHubが100文字より多い場合' do
        over = Faker::Base.regexify('[aあ]{101}')
        @user_detail.GitHub = over
        @user_detail.valid?
        expect(@user_detail.errors.full_messages).to include('Githubは100文字以内で入力してください')
      end
    end
  end
end
