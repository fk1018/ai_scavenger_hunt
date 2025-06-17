json.extract! game, :id, :location, :num_items, :time_limit, :penalty, :scoring_mode, :uuid, :created_at, :updated_at
json.url game_url(game, format: :json)
