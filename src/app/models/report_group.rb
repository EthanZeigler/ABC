##
# Group of reports. Generated by system.
class ReportGroup < ApplicationRecord
  has_and_belongs_to_many :reports
  validates_presence_of :name
end