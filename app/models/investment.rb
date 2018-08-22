class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :rents

  validates :number_of_panels, presence: true
  validates :state, presence: true, inclusion: { in: %w(pending confirmed) }

  monetize :amount_cents



end
