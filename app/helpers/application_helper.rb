module ApplicationHelper
    def cover_img_tag(book, width:800, height:600, fake_img: false)
        if fake_img
            if book.cover_img.attached?
                generate_cover_img(book,width,height)
            else
                image_tag "https://picsum.photos/300/300"
            end
        else
            generate_cover_img(book,width,height) if book.cover_img.attached?
        end
    end



    private
        def generate_cover_img(book, width, height)
        image_tag book.cover_img.variant(resize_to_limit:[width, height])
        end
end
