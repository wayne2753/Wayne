class Book < ApplicationRecord
    validates :title, presence: true
    validates :isbn,:isbn13, presence: true, uniqueness: true
    validates :list_price, :sell_price, :page_num, numericality: {greater_then: 0}


    has_one_attached :cover_img
    belongs_to :publisher

    scope :available, -> { where(:on_sell => true).where('list_price > 0')}
    # Ex:- scope :active, -> {where(:active => true)}匿名函數
end
# class Book < ApplicationRecord
#     validates :title, presence: true
#     validates :isbn, :isbn13, presence: true, uniqueness: true
#     validates :list_price, :sell_price, :page_num, numericality: { greater_than: 0 }
#   end

