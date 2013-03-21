class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:token_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  attr_accessible :balance,  :default => 5000
  has_many :games, :dependent => :destroy
  
  def spend(amount)
    self.balance = self.balance - amount
    self.save
  end
  
  def win(amount)
    self.balance = self.balance + amount
    self.save
  end
  
end
