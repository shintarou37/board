require 'rails_helper'

RSpec.describe Collect, type: :model do
  before do
    @collect = FactoryBot.build(:collect)
  end

  describe  '募集投稿機能' do
    context '投稿がうまくいくこと' do
      it '全ての項目が要件を満たしている場合' do
        expect(@collect).to be_valid
      end
    end
    context '投稿が上手くいかない' do
      it '募集要項が必須であること' do
        @collect.explanation = nil
        @collect.valid?
        expect(@collect.errors.full_messages).to include('Explanationを入力してください')
      end

      it '募集要項が1000文字以内であること' do
        over = Faker::Base.regexify('[aあ]{1001}')
        @collect.explanation = over
        @collect.valid?
        expect(@collect.errors.full_messages).to include('Explanationは1000文字以内で入力してください')
      end

      it '習得言語が必須であること' do
        @collect.language_id = nil
        @collect.valid?
        expect(@collect.errors.full_messages).to include('Languageを入力してください')
      end

      it '習得言語がid１では保存できない' do
        @collect.language_id = '1'
        @collect.valid?
        expect(@collect.errors.full_messages).to include('Languageは1以外の値にしてください')
      end
      it 'エンジニアの種類が必須であること' do
        @collect.type_id = nil
        @collect.valid?
        expect(@collect.errors.full_messages).to include('Typeを入力してください')
      end

      it 'エンジニアの種類がid１では保存できない' do
        @collect.type_id = '1'
        @collect.valid?
        expect(@collect.errors.full_messages).to include('Typeは1以外の値にしてください')
      end
      it '作りたいものが必須であること' do
        @collect.goal_id = nil
        @collect.valid?
        expect(@collect.errors.full_messages).to include('Goalを入力してください')
      end

      it '作りたいものがid１では保存できない' do
        @collect.goal_id = '1'
        @collect.valid?
        expect(@collect.errors.full_messages).to include('Goalは1以外の値にしてください')
      end
      it 'フレームワークが必須であること' do
        @collect.framework_id = nil
        @collect.valid?
        expect(@collect.errors.full_messages).to include('Frameworkを入力してください')
      end

      it 'フレームワークがid１では保存できない' do
        @collect.framework_id = '1'
        @collect.valid?
        expect(@collect.errors.full_messages).to include('Frameworkは1以外の値にしてください')
      end
    end
  end
end
