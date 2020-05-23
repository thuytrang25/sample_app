class CreateMicroposts < ActiveRecord::Migration[6.0]
	def change
		create_table :microposts do |t|
			t.text :content
			t.references :user, foreign_key: true
			t.timestamps
		end
		add_index :microposts, [:user_id, :created_at]
	end

end
# Create following relationships.
users = User.all
user = users.first
following = users[2..50]followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }