class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.boolean :like, null: false
      t.integer :user_id, null: false
      t.integer :comment_id, null: false

      t.timestamps null: false
    end
  end
end
