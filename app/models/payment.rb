class Payment < ActiveRecord::Base



    belongs_to :credit_card, :class_name => 'CreditCard', :foreign_key => :id_credit_card
    belongs_to :user, :class_name => 'User', :foreign_key => :id_user
end
