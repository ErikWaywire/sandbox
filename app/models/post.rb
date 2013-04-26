class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title
  validates :body, :length => { :maximum => 140 }
end
