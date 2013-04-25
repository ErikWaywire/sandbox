class User < ActiveRecord::Base
  attr_accessible :bio, :email, :name

  validates :name, :presence => true
  validates :email, :presence => true
  validates :bio, :presence => true

  has_many :posts
end
