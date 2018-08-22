class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :rents

  validates :number_of_panels, presence: true
  validates :state, presence: true, inclusion: { in: %w(pending confirmed) }

  monetize :amount_cents

  def income_per_year
    amount * project.yield
  end

  def past_gains
    project.active_months / 12.to_f * amount * project.yield
  end

  def remaining_gains
    project.remaining_months / 12 * amount * project.yield
  end

  def total_gains
    remaining_gains + past_gains
  end

end
