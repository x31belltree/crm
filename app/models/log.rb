class Log < ApplicationRecord
  belongs_to :matter
  
  validates :next_approach_date, presence: true
  validates :status, presence: true
  validates :comment, presence: true
  
  enum status: {
    default: 0,
    approach: 1,
    meeting: 2,
    abandonment: 3,
    close: 4,
  },  _prefix: true
  
end
