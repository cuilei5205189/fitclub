module Admin::ProductsHelper
  def render_product_collection_state(product)
    if current_user && !current_user.is_collect_of?(product)
      link_to("", collect_product_path(product), :remote => true, method: :post, class: "show-heart1 bi bi-heart ",style:"text-decoration:none;color:rgba(111,113,111 ,1);")
    elsif current_user && current_user.is_collect_of?(product)
      link_to("", un_collect_product_path(product), :remote=>true, method: :post,  class: "show-heart2 bi bi-heart ",style:"text-decoration:none;color:red;")
    else !current_user
      link_to("", "#", class: "show-heart1 fa fa-heart ",style:"text-decoration:none;color:rgba(111,113,111 ,1);")
    end
 end

 def render_product_status(product)
   if product.is_public
     content_tag(:span, "", :class => "fa fa-globe")
   else
     content_tag(:span, "", :class => "fa fa-lock")
   end
 end
end
