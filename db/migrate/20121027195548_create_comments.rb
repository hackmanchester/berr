class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title, :null => false
      t.string :text, :null => false
      t.integer :user_id, :null => false
      t.integer :parent_id
      t.boolean :promoted, :default => false, :null => false
      t.boolean :deleted, :default => false, :null => false

      t.timestamps
    end
  end
end
