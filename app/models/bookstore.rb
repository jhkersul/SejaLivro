class Bookstore < ActiveRecord::Base



    has_many :user_books, :class_name => 'UserBook'
    has_many :orders, :class_name => 'Order'
    has_many :bookstore_books, :class_name => 'BookstoreBook'
end
