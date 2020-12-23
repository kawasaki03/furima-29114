require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  context 'コメントができる時' do
    it 'text,user_id,item_idが存在するとコメントができる' do
      expect(@comment).to be_valid
    end
  end
  context 'コメントに失敗する時' do
    it 'textが空だと出品ができない' do
      @comment.text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Text can't be blank")
    end
    it 'user情報が紐づいていないと出品ができない' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('User must exist')
    end
    it 'item情報が紐づいていないと出品ができない' do
      @comment.item = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Item must exist')
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
