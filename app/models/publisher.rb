class Publisher < ApplicationRecord
    validates :name, :tel, :address, presence: true
    scope :available, -> { where(:online => true)}
    # Ex:- scope :active, -> {where(:active => true)}
    has_many :books
end
