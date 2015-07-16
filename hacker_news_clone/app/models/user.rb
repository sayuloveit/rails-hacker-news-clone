class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :comments
  has_many :postvotes
  has_many :commentvotes

  validates :username, uniqueness: {case_sensitive: false}
  validates :username, :password, presence: true



end
