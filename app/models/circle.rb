class Circle < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  has_many :events
end
