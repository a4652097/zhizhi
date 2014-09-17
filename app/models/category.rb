class Category < ActiveRecord::Base
  has_many :article,dependent: :destroy
end
