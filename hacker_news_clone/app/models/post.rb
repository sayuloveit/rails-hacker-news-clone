class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, :url, presence: true
end
