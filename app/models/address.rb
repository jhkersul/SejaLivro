class Address < ActiveRecord::Base

  # Relações
  belongs_to :user, dependent: :destroy

  # Validação
  validates :user_id, :zipcode, :street, :presence => true

end
