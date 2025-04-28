class Person < ApplicationRecord
  belongs_to :address, optional: true

  accepts_nested_attributes_for :address

  def teacher?  = is_a?(Teacher)
  def student?  = is_a?(Student)
  def parent?   = is_a?(Parent)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
