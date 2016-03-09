class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD
=======

>>>>>>> 27ace039ef506bb1152264f7e2c6681b4f7f1ec0
  belongs_to :univ
  has_many :circles
end
