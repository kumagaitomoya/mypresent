class Message < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :photo_name, :photo_message, presence: true

  validates :images, presence: true, presence: { message: 'を選択してください' }
end
