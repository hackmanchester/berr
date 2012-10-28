class Tag < ActiveRecord::Base
  attr_accessible :name

	has_many :tag_comment_links
  has_many :comments, :through => :tag_comment_links

  has_many :tag_user_links
  has_many :user, :through => :tag_user_links
end
