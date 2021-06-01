require 'rails_helper'
# user = User.new(nickname: "", email: "", password: "", password_confirmation: "", birth_date: "", first_name: "", last_name: "", first_kana: "", last_kana: "")
# bundle exec rspec spec/models/user_spec.rb
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題なし' do
      it "内容に問題なし" do
        expect(@user).to be_valid
      end
    end

    context '内容に問題あり' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスは重複ができない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "パスワードが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは５文字以下では登録できない" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "パスワードは半角英数字混合であること" do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "半角英語のみだと登録できない" do
        @user.password = 'ffffff'
        @user.password_confirmation = 'ffffff'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "全角英数混合だと登録できない" do
        @user.password = 'fffff１'
        @user.password_confirmation = 'fffff１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードは2回入力すること" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードと確認用パスワードは値の一致が必要であること" do
        @user.password = '000000f'
      @user.password_confirmation = '00000f'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザーの本名の苗字はからでは登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザーの本名の名前はからでは登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザーの本名は全角での入力であること" do
        @user.first_name = 'furima'
        @user.last_name = 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
      end
      it "ユーザーのフリガナは苗字が必要であること" do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it "ユーザーのフリガナは名前が必要であること" do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it "ユーザーの苗字のフリガナは全角カナでの入力の必要があること" do 
        @user.last_kana = 'ふりま'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid")
      end
      it "ユーザーの名前のフリガナは全角カナでの入力の必要があること" do
        @user.first_kana = 'ふりま'
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid")
      end
      it "生年月日がからでは登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
