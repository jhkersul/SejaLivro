class UserBook < ActiveRecord::Base



    belongs_to :book, :class_name => 'Book', :foreign_key => :id_book
    belongs_to :user, :class_name => 'Bookstore', :foreign_key => :id_user
end
