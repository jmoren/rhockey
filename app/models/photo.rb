class Photo < ActiveRecord::Base
  belongs_to :photoable, :polymorphic => true
  has_attached_file :thumb, :styles => { :thumb => "90x90#", :small => "30x30#" },
                    :path => ":rails_root/public/photos/:style/:basename.:extension",
                    :url => "/photos/:style/:basename.:extension"

end
