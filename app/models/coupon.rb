class Coupon < ActiveRecord::Base
  belongs_to :user

  belongs_to :category, counter_cache:true
  #attr_accessible :name, :price, :category_id

  has_many :line_items

  #paperclip
  has_attached_file :Brand_image,
                    :styles => {:thumb => "40x40", :small => "150x150"} ,
                    :default_url => "/images/:Brand_image.png"


  def self.search(search_query)
    if search_query
      find(:all,:conditions => ['name LIKE ?', "%#{ search_query}%"])
    else
      find(:all)
    end
  end

  #def image_file=(input_data)
   # self.filename = input_data.original_filename
    #self.content_type = input_data.content_type.chomp
    #self.binary_data = input_data.read
  #end
end
