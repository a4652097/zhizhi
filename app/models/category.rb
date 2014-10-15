class Category < ActiveRecord::Base
  has_many :article,dependent: :destroy,inverse_of: :category
  validates :name, presence: true

end
