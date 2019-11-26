class Publisher < ApplicationRecord
    scope :available, -> { where(:online => true)}
    # Ex:- scope :active, -> {where(:active => true)}
    has_many :books
end
