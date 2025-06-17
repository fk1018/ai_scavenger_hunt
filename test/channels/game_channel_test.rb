require "test_helper"

class GameChannelTest < ActionCable::Channel::TestCase
  test "subscribes with uuid" do
    game = Game.create!(uuid: "abcd")
    game.items.create!(name: "item", position: 1)

    subscribe(uuid: game.uuid)

    assert subscription.confirmed?
    assert_equal "items", transmissions.last[:type]
  end
end
