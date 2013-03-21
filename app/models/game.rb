class Game < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessible :payout, :default => 0 
  attr_accessible :wager
  
  serialize :reels
  
  after_initialize :init_reels
  
  REEL_VALUES = [1,2,3,4,5,6,7,8,9]
  
  def init_reels
    self.reels = [0,0,0]
  end
  
  def play(wager)
    user.spend(wager)
    self.wager = wager
    self.reels = [REEL_VALUES.sample, REEL_VALUES.sample, REEL_VALUES.sample]
    self.payout = reels.uniq.length == 1 ? wager * reels[0] : 0
    user.win(payout)
    self.save
  end
  
end
