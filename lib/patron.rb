class Patron < ActiveRecord::Base

	validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :books

  def to_s
  	name
  end

  def books_display
     books = Book.find_by_id(params['id'])
     string = ""
     if books.empty?
       string = "None"
     else
       books.each do |b|
         string += "#{b.title}\n       "
       end
     end
     string
   end
end