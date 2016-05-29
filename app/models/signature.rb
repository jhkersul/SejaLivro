class Signature < ActiveRecord::Base



    belongs_to :user, :class_name => 'User', :foreign_key => :id_user
end
