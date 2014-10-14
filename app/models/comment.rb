class Comment < ActiveRecord::Base
  belongs_to :article,inverse_of: :comment
  validates :content, presence: true
end
