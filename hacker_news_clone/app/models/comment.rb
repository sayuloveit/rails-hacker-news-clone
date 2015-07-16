class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates :content, :user_id, :post_id, presence: true
end
