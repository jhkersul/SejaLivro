class Category < ActiveRecord::Base



    has_many :user_preferences, :class_name => 'UserPreference'
    has_many :book_categories, :class_name => 'BookCategory'
end
