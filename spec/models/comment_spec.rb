require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe  'コメント機能' do
    context 'コメントがうまくいくこと' do
      it '全ての項目が要件を満たしている場合' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントが上手くいかない' do
      it 'コメントが必須であること' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Textを入力してください")
      end

      it 'コメントが200文字以内であること' do
        over = Faker::Base.regexify("[aあ]{201}")
        @comment.text = over
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Textは200文字以内で入力してください")
      end
    end
  end
end
