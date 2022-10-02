json.extract! player, :id, :name, :position, :last_competition, :contract, :manager_id, :transfermarkt_id, :created_at, :updated_at
json.url player_url(player, format: :json)
