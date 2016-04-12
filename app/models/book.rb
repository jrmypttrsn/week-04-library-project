class Book < ActiveRecord::Base

	validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true
  validates :isbn, uniqueness: true

  belongs_to :library
  belongs_to :patron

  def to_s
  	title
  end

end
