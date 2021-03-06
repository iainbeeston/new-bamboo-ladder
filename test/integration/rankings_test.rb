require 'integration_test_helper'

class RankingsTest < CapybaraTestCase

  test "progression after a few games" do
    Player.update_all(elo_rating: nil, position: nil)
    assume_a_trusted_user

    submit_result("Carol", "Alice")
    submit_result("Bob", "Dan")

    # Winners ahead of less lucky players
    assert_rankings "Carol", :>, "Alice"
    assert_rankings "Bob", :>, "Dan"

    # Winners together, and so are losers
    assert_rankings "Carol", :==, "Bob"
    assert_rankings "Alice", :==, "Dan"

    # Non-players do not appear
    assert_not_ranked "Erin"

    submit_result("Bob", "Carol")
    assert_rankings "Bob", :>, "Carol"
  end

end
