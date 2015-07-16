class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :posts

  validates :title, :url, presence: true
end
