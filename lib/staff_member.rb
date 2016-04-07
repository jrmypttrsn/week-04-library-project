class StaffMember < ActiveRecord::Base

	validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  belongs_to :library

end