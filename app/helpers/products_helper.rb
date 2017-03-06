module ProductsHelper
  def default_image product
    if product.image.blank?
      image_tag "default.png", size: "#{Settings.width}x#{Settings.height}"
    else
      image_tag product.image.url, size: "#{Settings.width}x#{Settings.height}"
    end
  end
end
