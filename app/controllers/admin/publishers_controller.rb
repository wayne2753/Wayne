class Admin::PublishersController < ApplicationController
    before_action :find_publisher, only:[:edit, :update, :destroy]

    layout 'backend_publisher'

    def index
        @publisher = Publisher.all
    end
    def new
        @publisher = Publisher.new
    end
    def create 
        @publisher = Publisher.new(publisher_params)
            if @publisher.save
            redirect_to admin_publishers_path, notice: "新增書本成功"
        else
            render :new #借new.html.erb 用這個較合適 不會清空欄位 借畫面渲染
            # redirect_to new_publisher_path, notice: "新增書本失敗"  #直接轉址
        end
    end


    def edit
        # find_publisher
        # @publisher = publisher.find(params[:id])
        #@publisher = publisher.find_by(id: params["id"]) 這也可以 但照ruby寫法 寫上面較好
    end


    def update
        # find_publisher
        # @publisher = publisher.find(params[:id])
        if @publisher.update(publisher_params)
            redirect_to admin_publishers_path, notice: '更新成功'
        else
            render admin_publisher_path
        end
    end

    def destroy
        # find_publisher
        # @publisher = publisher.find(params[:id])
        @publisher.destroy
        redirect_to admin_publishers_path, notice: '資料已刪除'
    end


    

    def find_publisher
        @publisher = Publisher.find(params[:id])
    end

    private
    def publisher_params
        # strong parameters 強參數
        params.require(:publisher).permit(:name, :address, :tel, :note, :online)
        
    end
end
