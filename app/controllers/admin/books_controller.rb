class Admin::BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :find_book, only:[:show, :edit, :update, :destroy]


    layout 'backend'

    def index
        @book = Book.all.where(on_sell: true).with_attached_cover_img.page(
        params[:page]
        ).per(3)
        
    end
    def new
        @book = Book.new
    end
    def create 
        @book = Book.new(book_params)
            if @book.save
            redirect_to admin_book_path, notice: "新增書本成功"
        else
            render :new #借new.html.erb 用這個較合適 不會清空欄位 借畫面渲染
            # redirect_to new_book_path, notice: "新增書本失敗"  #直接轉址
        end
    end


    def edit
        # find_book
        # @book = Book.find(params[:id])
        #@book = Book.find_by(id: params["id"]) 這也可以 但照ruby寫法 寫上面較好
    end


    def update
        # find_book
        # @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to edit_admin_book_path(@book), notice: '更新成功'
        else
            render :edit
        end
    end

    def destroy
        # find_book
        # @book = Book.find(params[:id])
        @book.destroy
        redirect_to admin_book_path, notice: '資料已刪除'
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
