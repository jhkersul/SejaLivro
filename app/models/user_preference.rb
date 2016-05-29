class UserPreference < ActiveRecord::Base



    belongs_to :category, :class_name => 'Category', :foreign_key => :id_category
    belongs_to :user, :class_name => 'User', :foreign_key => :id_user
end
