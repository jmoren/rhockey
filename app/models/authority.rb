class Authority < ActiveRecord::Base
  belongs_to :referi
  belongs_to :game
end
