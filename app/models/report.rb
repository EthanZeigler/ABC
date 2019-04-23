class Report < ApplicationRecord
  has_and_belongs_to_many :report_groups
  validates_presence_of :description, :involved, :location, :time
  validates :resolved, inclusion: { in: [true, false] }
end
