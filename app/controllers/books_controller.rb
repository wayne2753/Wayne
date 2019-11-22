class BooksController < ApplicationController
    def index
        @book = Book.all
    end
    def new
        @book = Book.new
    end
    def create 
        @book = Book.new(book_params)
        if @book.save
            redirect_to root_path, notice: "新增書本成功"
        else
            render :new #借new.html.erb 用這個較合適 不會清空欄位 借畫面渲染
            # redirect_to new_book_path, notice: "新增書本失敗"  #直接轉址
        end
    end


    def edit
        @book = Book.find(params[:id])
        #@book = Book.find_by(id: params["id"]) 這也可以 但照ruby寫法 寫上面較好
    end


    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to root_path, notice: '更新成功'
        else
            render :edit
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to root_path, notice: '資料已刪除'
    end


    def  show
        @book = Book.find(params[:id])
    end

    private
    def book_params
        # strong parameters 強參數
        params.require(:book).permit(:title,:description, :list_price, :sell_price, :page_num, :isbn, :isbn13)
        
    end
end
