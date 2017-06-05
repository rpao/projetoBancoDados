class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :pessoa, required: false
  def self.search(search)
    if search
      where('email LIKE ?', "%#{search}%")
      
    else
      where('email LIKE ?', "%%")
    end
  end
end
