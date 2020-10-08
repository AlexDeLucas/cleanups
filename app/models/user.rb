class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cleanups 

  # Are any of these validations actually necessary? Maybe just the role validation? Does Devise take care of the rest?
  validates :email, uniqueness: true
  validates :encrypted_password, presence: true
  validates :role, inclusion: { in: ['user', 'admin'] }

  def is_admin?
    role == 'admin'
  end

end
