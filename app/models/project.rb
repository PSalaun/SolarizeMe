class Project < ApplicationRecord
  belongs_to :user
  has_many :investments
  has_many :outputs
  has_many :images

end
