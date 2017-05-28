class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def self.search(search)
    if search
      #where('data_de_inicio LIKE ?', "%#{search}%")
      where('true')
    else
      #where('data_de_inicio LIKE ?', "%%")
      where('true')
    end
  end
end
