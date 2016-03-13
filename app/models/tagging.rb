class Tagging < ActiveRecord::Base
  belongs_to :utag
  belongs_to :circle
end
