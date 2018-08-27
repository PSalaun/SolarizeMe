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
    (project.active_months / 12.to_f * amount_cents * project.yield) / 100
  end

  def last_month_gain
    last_month_outputs = project.outputs.where(:date => 1.months.ago..Date.today)
    p last_month_outputs
    outputs = last_month_outputs.group_by_day(:date).maximum(:quantity)
    p outputs
    day_value = 0
    outputs.each do |date, value|
      day_value += value * project.kwh_price_cents
    end
    day_value / 100
  end

  def kwc
    project.panel_watt * number_of_panels / 1000
  end

  def remaining_gains
    (project.remaining_months / 12 * amount_cents * project.yield) / 100
  end

  def total_gains
    remaining_gains + past_gains
  end

  def profits
    (total_gains * 100 - amount_cents) / 100
  end
end
