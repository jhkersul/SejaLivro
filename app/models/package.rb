class Package < ActiveRecord::Base



    belongs_to :order, :class_name => 'Order', :foreign_key => :id_order
    has_many :package_books, :class_name => 'PackageBook'
    belongs_to :user, :class_name => 'User', :foreign_key => :id_user
end
