class GameChannel < ApplicationCable::Channel
  def subscribed
    @game = Game.find_by(uuid: params[:uuid])
    if @game
      stream_for @game
      transmit(type: "items", items: @game.items.order(:position).as_json)
    else
      reject
    end
  end

  # Create a new player in this game and notify others
  def join(data)
    return unless @game
    player = @game.players.create(name: data["name"], admin: false, total_score: 0)
    GameChannel.broadcast_to(@game, type: "player_joined", player: player.as_json)
  end

  # Upload a photo submission for an item
  def submit(data)
    return unless @game
    player = @game.players.find(data["player_id"])
    item = @game.items.find(data["item_id"])
    Submission.create(player: player, item: item, photo: data["photo"])
  end
end
