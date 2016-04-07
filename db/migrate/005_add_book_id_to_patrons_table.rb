class AddBookIdToPatronsTable < ActiveRecord::Migration
	def change
		add_column :patrons, :book_id, :integer
	end
end