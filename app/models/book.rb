class Book < ActiveRecord::Base



    has_many :user_books, :class_name => 'UserBook'
    has_many :package_books, :class_name => 'PackageBook'
    has_many :bookstore_books, :class_name => 'BookstoreBook'
    has_many :book_categories, :class_name => 'BookCategory'
end
