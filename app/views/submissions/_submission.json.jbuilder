json.extract! submission, :id, :player_id, :item_id, :photo, :correct, :points, :created_at, :updated_at
json.url submission_url(submission, format: :json)
