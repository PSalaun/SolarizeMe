class Project < ApplicationRecord
  belongs_to :user
  has_many :investments, dependent: :destroy
  has_many :outputs, dependent: :destroy
  has_many :images

  validates :name, uniqueness: true, presence: true
  validates :price_cents, presence: true
  validates :yield, presence: true
  validates :panels_quantity, presence: true
  validates :crowdfunding_start_date, presence: true
  validates :crowdfunding_end_date, presence: true
  validates :comissioning_date, presence: true
  validates :end_of_contract, presence: true

  monetize :price_cents
  monetize :kwh_price_cents

  mount_uploader :photo, PhotoUploader

  def days_to_completion
    (crowdfunding_end_date - Date.today).to_i
  end

  def completion_rate
    total_investment = self.investments.sum(:number_of_panels)
    (total_investment * 100 / panels_quantity).to_f # It returns the percentage in float: i.e. 5.0 (and not 0.05)
  end

  def available_panels
    sum = 0
    investments.each do |investment|
      sum += investment.number_of_panels
    end
    return panels_quantity - sum
  end

  def status
    if Date.today - crowdfunding_start_date < 0
      return "Future crowdfunding"
    elsif Date.today - crowdfunding_end_date < 0
      return "Active crowdfunding"
    elsif Date.today - comissioning_date < 0
      return "Under construction"
    else
      return "Operational"
    end
  end

  def total_cost
    panels_quantity * price
  end

  def funds_pledged
    price * (panels_quantity - available_panels)
  end

  def remaining_crowdfunding_days
    if status == "Crowdfunding"
      days = (crowdfunding_end_date - crowdfunding_start_date).to_i
      return "#{days} days to go"
    elsif status == "Under construction"
      return "Fully funded and under construction"
    elsif status == "Starting soon!"
      return "Crowdfunding starting soon!"
    else
      return "Project already fully funded!"
    end
  end

  def completion_rate
    funds_pledged / total_cost * 100
  end

  def active_months
    start_date_month = comissioning_date.year * 12 + comissioning_date.month
    current_month = (Date.today.year * 12 + Date.today.month)
    current_month - start_date_month
  end

  def remaining_months
    end_date_month = end_of_contract.year * 12 + end_of_contract.month
    current_month = (Date.today.year * 12 + Date.today.month)
    end_date_month - current_month
  end

  def duration_months
    active_months + remaining_months
  end

  def kwc
    panels_quantity * panel_watt / 1000
  end
end
