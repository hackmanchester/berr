class AddTextMdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :text_converted, :string
  end
end
