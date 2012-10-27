class Comment < ActiveRecord::Base
  attr_accessible :parent_id, :promoted, :text, :title, :user_id
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :text

  has_one :child, :class_name => "Comment"
  belongs_to :parent, :class_name => "Comment" 
end
