module PortfoliosHelper
  def image_generator(width, height)
    "https://via.placeholder.com/#{width}x#{height}"
  end

  def portfolio_img img, type
    if img.model.main_image? || img.model.thumb_image?
      # binding.pry
      img.url
    elsif type == 'thumb'
      image_generator(350, 200)
    else
      image_generator(600, 400)
    end
  end
end
