require 'rails_helper'
# テスト用 bundle exec rspec spec/models/item_spec.rb
RSpec.describe Item, type: :model do
  describe "新規出品" do
    before do
      @item = FactoryBot.build(:item)
    end

    context '問題なし' do
      it '適切に入力すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    
    context '内容に問題あり' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が空だと出品できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'カテゴリーの情報がないと出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it 'カテゴリーは---では出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
        end
      it '商品の状態の情報がないと出品できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank", "State is not a number")
      end
      it '商品の状態は---では出品できない' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 0")
      end
      it '配送料の負担についての情報がないと出品できない' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank", "Fee is not a number")
      end
      it '配送料の負担は---では出品できない' do
        @item.fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 0")
      end
      it '発送限の地域についての情報がないと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it '発送限の地域は---では出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '発送までの日数の情報がないと出品できない' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank", "Days is not a number")
      end
      it '発送までの日数は---では出品できない' do
        @item.days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 0")
      end
      it '販売価格についての情報がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は300~9999999円の間でないと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格が上限をこえる場合は出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '販売価格は半角数字でないと出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
