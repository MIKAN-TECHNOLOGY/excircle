class Circle < ActiveRecord::Base
  has_attached_file :avatar,
                      styles:  { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :avatar,
                                      content_type: ["image/jpg","image/jpeg","image/png"]
　validates :user_name, :presence => true
  belongs_to :user
  belongs_to :tag
  has_many :events
end
