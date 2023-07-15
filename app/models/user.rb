class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, length: {in: 3...1000, message: "Debe tener entre 3 caracteres y 100"}
  validates :name, length: {in: 3...1000, message: "Debe tener entre 3 caracteres y 100"}
  validates :lastname, length: {in: 3...1000, message: "Debe tener entre 3 caracteres y 100"}
  validates :image, presence: true

  def email_com
    "#{email}"
  end

  def self.random_pair
    all.sample(2)
  end
  def full_name
    "#{name}"  " #{lastname}"
  end




end
