class Item < ActiveRecord::Base
  belongs_to :list
  attr_accessible :image, :name, :note, :tag
end
