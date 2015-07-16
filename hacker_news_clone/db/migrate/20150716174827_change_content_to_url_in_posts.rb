class ChangeContentToUrlInPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :content, :url
  end
end
