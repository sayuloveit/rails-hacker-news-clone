class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_votes, dependent: :destroy

  validates :title, :url, presence: true
end
