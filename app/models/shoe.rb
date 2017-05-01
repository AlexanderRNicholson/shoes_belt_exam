class Shoe < ActiveRecord::Base
  belongs_to :user
  
  validates :name, presence: true
  validates :amount, presence: true, inclusion: { :in => 1..100000, :message => "The amount must be between $1 and $100000." }
end
