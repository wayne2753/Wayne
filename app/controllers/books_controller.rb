class BooksController < ApplicationController
    before_action :find_book, only:[:show]
    def index
        @book = Book.all.where(on_sell: true).with_attached_cover_img.page(
        params[:page]
        ).per(3)
        
    end
    

    def  show
        # find_book
        # @book = Book.find(params[:id])
    end

    def find_book
        @book = Book.find(params[:id])
    end

    private
    def book_params
        # strong parameters 強參數
        params.require(:book).permit(:title,:description, :list_price, :sell_price, :page_num, :isbn, :isbn13,:cover_img, :on_sell, :published_at, :publisher_id)
        
    end
end
