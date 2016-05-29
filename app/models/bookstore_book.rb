class BookstoreBook < ActiveRecord::Base



    belongs_to :book, :class_name => 'Book', :foreign_key => :id_book
    belongs_to :bookstore, :class_name => 'Bookstore', :foreign_key => :id_bookstore
end
