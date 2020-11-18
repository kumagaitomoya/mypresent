class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :attendance

  validates :name, presence: true, presence: { message: 'を入力してください' }

  validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }

  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'に英字と数字の両方を含めて入力してください' }

  validates :email, uniqueness: true

  with_options numericality: { other_than: 1, message: '選択してください' } do
    validates :attendance_id
    validates :prefecture_id
  end

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'にハイフンを入れてください' }
    # 郵便番号
    validates :municipality
    # 市区町村
    validates :address
    # 番地
  end
end
