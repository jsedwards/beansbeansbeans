class Comment < ActiveRecord::Base
  belongs_to :listing
  validates :body, presence: true, length: { minimum: 10 }
end