class User < ActiveRecord::Base

    enum gender: [ :masculino, :feminino ]

    has_many :addresses, :class_name => 'Address'
    accepts_nested_attributes_for :addresses

    has_many :user_preferences, :class_name => 'UserPreference'
    has_many :support_tickets, :class_name => 'SupportTicket'
    has_many :signatures, :class_name => 'Signature'
    has_many :payments, :class_name => 'Payment'
    has_many :packages, :class_name => 'Package'
    has_many :credit_cards, :class_name => 'CreditCard'

    validates :password, confirmation: true
end
