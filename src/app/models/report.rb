##
# Bully report storage
class Report < ApplicationRecord
  has_and_belongs_to_many :report_groups
  validates_presence_of :description, :involved, :location, :time
  # different for booleans
  validates :resolved, inclusion: { in: [true, false] }
end
