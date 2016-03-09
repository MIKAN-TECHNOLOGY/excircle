class Circle < ActiveRecord::Base
  belongs_to :user
<<<<<<< HEAD
  belongs_to :tag
=======
>>>>>>> 27ace039ef506bb1152264f7e2c6681b4f7f1ec0
  has_many :events
end
