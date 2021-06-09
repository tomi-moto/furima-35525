require 'rails_helper'
# テスト用    bundle exec rspec spec/models/order_spec.rb   
RSpec.describe OrderUser, type: :model do
  describe "商品購入" do
    before do
      @order_user = FactoryBot.build(:order_user)
    end

    context '問題なし' do
      it "適切に入力すれば購入できる" do
        expect(@order_user).to be_valid
      end
    end

    context '内容に問題あり' do
      it '郵便番号がからでは購入できない' do
        @order_user.post_num = ''
        @order_user.valid?
        expect(@order_user.errors.full_messages).to include("Post num can't be blank")
      end
      it '郵便番号は３桁の数字ハイフン４桁の数字でなければ購入できない' do
        @order_user.post_num = '00-0000'
        @order_user.valid?
        expect(@order_user.errors.full_messages).to include("Post num is invalid. Include hyphen(-)")
      end
      it '都道府県は---では購入できない' do
        @order_user.prefecture_id = 0
        @order_user.valid?
        expect(@order_user.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県は空では購入できない' do
        @order_user.prefecture_id = ''
        @order_user.valid?
        expect(@order_user.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村は空では購入できない' do
        @order_user.city = ''
        @order_user.valid?
        expect(@order_user.errors.full_messages).to include("City can't be blank")
      end
      it '番地はからでは購入できない' do
        @order_user.address = ''
        @order_user.valid?
        expect(@order_user.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号はからでは購入できない' do
        @order_user.phone_number = ''
        @order_user.valid?
        expect(@order_user.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は１１桁の数字でなければ購入できない' do
        @order_user.phone_number = '0801234567'
        @order_user.valid?
        expect(@order_user.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では購入できない' do
        @order_user.token = nil
        @order_user.valid?
        expect(@order_user.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end