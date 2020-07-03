class Matter < ApplicationRecord
    belongs_to :campany
    has_many :logs
end
