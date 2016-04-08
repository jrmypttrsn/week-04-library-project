class Patron < ActiveRecord::Base

	validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :books

  def to_s
  	name
  end

end