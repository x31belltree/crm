class Matter < ApplicationRecord
    belongs_to :campany
    has_many :logs
    
    validates :name, presence: true
    validates :detail, presence: true
    validates :contact_person, presence: true
end
