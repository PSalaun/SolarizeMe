class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :rents

  validates :number_of_panels, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending confirmed) }

end
