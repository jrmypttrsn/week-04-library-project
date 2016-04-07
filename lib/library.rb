class Library < ActiveRecord::Base

	validates :branch_name, presence: true
  validates :branch_name, uniqueness: true
  validates :address, presence: true
  validates :address, uniqueness: true
  validates :phone_number, presence: true
  validates :phone_number, uniqueness: true

  has_many :staff_members
  has_many :books
  
end
