class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :rents

  validates :number_of_panels, presence: true
  # validates :status, presence: true
  validates :state, presence: true
  # validates :status, inclusion: { in: %w(pending confimed) }

  monetize :amount_cents
end
