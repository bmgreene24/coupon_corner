require 'barby'
require 'barby/outputter/png_outputter'
require 'barby/barcode/ean_13'


# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

# generate a PNG barcode image from the given data,
# using a default symbology of EAN13
# return a URI relative to the document root

  def barcode_image_uri(data,symbology = 'EAN13')

    # check to see if we don't already have this barcode image
    uri = '/barcode_images/' + CGI.escape(symbology) + '_' + CGI.escape(data) + '.png'
    fname = Rails.root + '/public' + uri

    # if the barcode image doesn't already exist then generate and save it
    if ! File.exists?(fname)

      str = 'Barby::'+symbology+'.new("'+data+'")'

      begin
        barcode = eval str
      rescue Exception => exc
        barcode = Barby::EAN13.new(data)   # fall back to Code128B
        #barcode.to_image_with_data.write(data)
      end

      File.open("#{Rails.root}/public/barcode_images/EAN13_#{data}.png", 'wb') do |f|
      barcode.with_options :height => 40, :width => 40 do |img|
      f.write img.to_png
      end
      end
      uri
    end

  end
end
