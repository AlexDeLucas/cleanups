class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :role, inclusion: { in: ['user', 'admin'] }       
  has_many :cleanups, dependent: :destroy 

  def is_admin?
    role == 'admin'
  end

end
