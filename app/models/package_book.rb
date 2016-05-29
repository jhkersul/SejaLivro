class PackageBook < ActiveRecord::Base



    belongs_to :book, :class_name => 'Book', :foreign_key => :id_book
    belongs_to :package, :class_name => 'Package', :foreign_key => :id_package
end
