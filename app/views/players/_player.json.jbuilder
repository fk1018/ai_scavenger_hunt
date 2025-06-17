json.extract! player, :id, :game_id, :name, :admin, :total_score, :created_at, :updated_at
json.url player_url(player, format: :json)
