class Listing < ActiveRecord::Base
  validates_presence_of :name
  has_many :comments, dependent: :destroy
end