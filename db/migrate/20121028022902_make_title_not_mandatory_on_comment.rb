class MakeTitleNotMandatoryOnComment < ActiveRecord::Migration
  def up
  	change_column :comments, :title, :string, :null => true
  end

  def down
  end
end
