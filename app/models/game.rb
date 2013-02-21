class Game < ActiveRecord::Base
  attr_accessible :payout, :wager
  belongs_to :user
end
