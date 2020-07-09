class Company < ApplicationRecord
    has_many :matters
    
    validates :name, presence: true
    validates :phone_number, presence: true, format: {with: /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/}
    validates :address, presence: true
    validates :industry, presence: true
end
