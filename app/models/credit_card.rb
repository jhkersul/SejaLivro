class CreditCard < ActiveRecord::Base

    has_many :payments, :class_name => 'Payment'
    belongs_to :user, :class_name => 'User', :foreign_key => :user_id

end
