class List < ActiveRecord::Base
  attr_accessible :category, :name, :publicity, :status
  belongs_to(:user)
  has_many(:items)
  validates :name, :presence => true
end
