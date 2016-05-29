class SupportTicket < ActiveRecord::Base


    self.inheritance_column = :ruby_type
    belongs_to :user, :class_name => 'User', :foreign_key => :id_user
end
