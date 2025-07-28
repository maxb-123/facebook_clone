class Post < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Validations
  validates :content, presence: true, length: { maximum: 1000 }

  # Returns the number of likes for this post
  def likes_count
    likes.count
  end
end