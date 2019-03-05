json.extract! report, :id, :description, :location, :time, :involved, :resolved, :created_at, :updated_at
json.url report_url(report, format: :json)
