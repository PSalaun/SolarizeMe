class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :rents
end
