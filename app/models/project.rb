class Project < ApplicationRecord
  belongs_to :user
  has_many :investments
  has_many :outputs
  has_many :images

  validates :name, uniqueness: true, presence: true
  validates :price_cents, presence: true
  validates :yield, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :panels_quantity, presence: true

  def days_to_completion
    (end_date - Date.now).to_i
  end
end
