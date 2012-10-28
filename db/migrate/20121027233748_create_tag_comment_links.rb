class CreateTagCommentLinks < ActiveRecord::Migration
  def change
    create_table :tag_comment_links do |t|
      t.integer :tag_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
