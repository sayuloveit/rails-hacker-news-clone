class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :commentvotes

  validates :content, :user_id, :post_id, presence: true
end
