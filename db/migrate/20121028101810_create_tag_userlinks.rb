class CreateTagUserlinks < ActiveRecord::Migration
  def change
    create_table :tag_user_links do |t|
      t.integer :tag_id
      t.integer :user_id

      t.timestamps
    end
  end
end
