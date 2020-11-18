require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '#create' do
    context 'ユーザー登録がうまくいくとき' do
      it 'building_nameとallergy以外存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上,半角英数字混合であれば登録できる' do
        @user.password = 'Ab0508'
        @user.password_confirmation = 'Ab0508'
        expect(@user).to be_valid
      end

      it 'passwordがpassword_confirmationが一致すると登録できる' do
        @user.password = 'Ab0508'
        @user.password_confirmation = 'Ab0508'
        expect(@user).to be_valid
      end

      it 'passwordは、半角英数字混合での入力だと登録できる' do
        @user.password = 'Ab0508'
        expect(@user).to be_valid
      end

      it 'メールアドレスは、@を含めば登録できる' do
        @user.email = 'kuma@gmail.com'
        expect(@user).to be_valid
      end

      it 'nameは、全角入力であれば登録できる' do
        @user.name = '田中太郎'
        expect(@user).to be_valid
      end

      context 'ユーザー登録がうまくいかないとき' do
        it 'nameが空だと登録できない' do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('名前を入力してください')
        end

        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('Eメールを入力してください')
        end

        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードを入力してください')
        end

        it 'prefecture_id が1だと登録できない' do
          @user.prefecture_id = '1'
          @user.valid?
          expect(@user.errors.full_messages).to include('都道府県を選択してください')
        end

        it 'attendance_idが1だと登録できない' do
          @user.attendance_id = '1'
          @user.valid?
          expect(@user.errors.full_messages).to include('ご出席について選択してください')
        end

        it 'municipalityが空だと保存できないこと' do
          @user.municipality = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('市区町村を入力してください')
        end

        it 'addressが空だと保存できないこと' do
          @user.address = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('番地を入力してください')
        end

        it '名前は、全角入力でなければ登録できない' do
          @user.name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前は全角で入力してください')
        end

        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @user.postal_code = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include('郵便番号にハイフンを入れてください')
        end

        it 'passwordが5文字以下であれば登録できない' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
        end

        it 'passwordがpassword_confirmationが一致してないと登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '123457'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
        end

        it 'passwordは、半角英数字混合での入力でのないと登録できない' do
          @user.password = 'AAA１１１１'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードに英字と数字の両方を含めて入力してください')
        end

        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
        end
      end
    end
  end
end
