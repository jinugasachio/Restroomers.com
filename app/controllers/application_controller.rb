class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery unless: -> { request.format.json? }

  def split_base64(uri_str)
    if uri_str.match(/data:(.*?);(.*?),(.*)/)
      uri = {}
      uri[:type]      = Regexp.last_match(1)
      uri[:encoder]   = Regexp.last_match(2)
      uri[:data]      = Regexp.last_match(3)
      uri[:extension] = Regexp.last_match(1).split('/')[1]
      uri
    end
  end

  def decode_base64(uri_str, room)
    timestamp         = DateTime.now.strftime('%Q')
    image_data        = split_base64(uri_str)
    image_data_string = image_data[:data]
    image_data_binary = Base64.decode64(image_data_string)
    temp_img_file     = Tempfile.create
    temp_img_file.binmode
    temp_img_file << image_data_binary
    temp_img_file.rewind
    img_params = {
      filename: "room#{room.id}-#{timestamp}.#{image_data[:extension]}",
      type:      image_data[:type],
      tempfile:  temp_img_file 
    }
    ActionDispatch::Http::UploadedFile.new(img_params)
  end

end
