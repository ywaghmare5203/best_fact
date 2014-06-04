class Fact < ActiveRecord::Base
  
   has_attached_file :fact_image, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "411x274>", :large => "1280x854>" }, :default_url => "/images/missing.gif"
end
