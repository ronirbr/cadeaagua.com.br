class Report < ApplicationRecord
  validates :street, presence: true
  validates :water_out_at, presence: true
  validates :status, presence: true, inclusion: { in: %w[sem_agua agua_voltou] }
end
