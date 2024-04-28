class AddUserToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true

    reversible do |dir|
      dir.up do
        user = User.first
        Post.all.each do |post|
          post.update(user_id: user.id)
        end
      end
    end
  end
end
