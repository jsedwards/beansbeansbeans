class Comment < ActiveRecord::Base
  belongs_to :listing
  validates_presence_of :body
end