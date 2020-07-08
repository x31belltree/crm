class Log < ApplicationRecord
  belongs_to :matter
  
  enum status: {
    default: 0,
    approach: 1,
    meeting: 2,
    abandonment: 3,
    close: 4,
  },  _prefix: true
  
end
