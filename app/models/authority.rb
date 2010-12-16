class Authority < ActiveRecord::Base
  belongs_to :game
  belongs_to :referi
end
