class UserPreference < ActiveRecord::Base
    belongs_to :category, :class_name => 'Category', :foreign_key => :category_id
    belongs_to :user, :class_name => 'User', :foreign_key => :user_id
end
