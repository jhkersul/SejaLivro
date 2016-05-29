class BookCategory < ActiveRecord::Base



    belongs_to :book, :class_name => 'Book', :foreign_key => :id_book
    belongs_to :category, :class_name => 'Category', :foreign_key => :id_category
end
