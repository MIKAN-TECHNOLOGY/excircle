class Utag < ActiveRecord::Base
  has_many :taggings
  has_many :circles, through: :taggings
end
