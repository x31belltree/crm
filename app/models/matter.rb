class Matter < ApplicationRecord
  belongs_to :company
  has_many:logs
end
