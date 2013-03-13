class AddReelsToGame < ActiveRecord::Migration
  def change
    add_column :games, :reels, :string
  end
end
