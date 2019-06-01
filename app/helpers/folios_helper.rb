module FoliosHelper
  def image_generator(height:, width:)
    "http://via.placeholder.com/#{height}x#{width}"
  end

  def folio_image(image, type)
    if image
      image
    elsif type == 'thumb'
      image_generator(height: "350", width: "200")
    else
      image_generator(height: "600", width: "400")
    end
  end

end
