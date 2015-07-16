class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :comments

  validates :username, uniqueness: {case_sensitive: false}
  validates :username, :password, presence: true



end
