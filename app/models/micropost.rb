class Micropost < ApplicationRecord
  belongs_to :user
  scope :order_by_created, ->{order(created_at: :desc)}
  scope :feed, ->(id){where(user_id: id)}

  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.micropost.content}
  validate :picture_size

  private
  def picture_size
    return if picture.size < Settings.micropost.photo_size.megabytes
    errors.add(:picture, t("error.photo_size"))
  end
end
