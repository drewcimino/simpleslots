class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :wager
      t.integer :payout

      t.timestamps
    end
  end
end
