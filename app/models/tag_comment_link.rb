class TagCommentLink < ActiveRecord::Base
  attr_accessible :comment_id, :tag_id

  belongs_to :comment
  belongs_to :tag
end
