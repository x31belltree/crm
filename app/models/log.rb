class Log < ApplicationRecord
  belongs_to :matter
  
  validates :next_approach_date, presence: true
  validates :status, presence: true
  validates :comment, presence: true
  
  enum status: {
    approach: 0,
    meeting: 1,
    abandonment: 2,
    close: 3
  },  _prefix: true
  
end
