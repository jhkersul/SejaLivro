class Order < ActiveRecord::Base



    belongs_to :bookstore, :class_name => 'Bookstore', :foreign_key => :id_bookstore
    has_many :packages, :class_name => 'Package'
end
