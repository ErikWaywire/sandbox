class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body
  validates :body, presence: true, :length => { :maximum => 140 }
  validates :user_id, presence: true
  default_scope order: 'posts.created_at DESC'
end
