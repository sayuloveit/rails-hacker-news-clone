class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates :title, :content, presence: true
end
