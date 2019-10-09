require "minitest/autorun"
require 'minitest/stub_any_instance'
require_relative "../models/voting_machine"
class TestVotingMachine < Minitest::Test
  def test_add_category
    machine = VotingMachine.new(1, 1)
    machine.add_category("TestCategory")
    assert_equal machine.categories, ["TestCategory"]

    machine.add_category("TestCategory2")
    assert_equal machine.categories, ["TestCategory", "TestCategory2"]

    machine.add_category("TestCategory")
    assert_equal machine.categories, ["TestCategory", "TestCategory2"]

    assert_equal machine.send(:valid_category?, "Invalid"), false
  end

  def test_add_vote
    machine = VotingMachine.new(1, 1)
    category1 = "TestCategory1"
    category2 = "TestCategory2"

    machine.add_category(category1)    
    machine.add_category(category2)    
    machine.record_vote(category1, "Bob", "Mary")
    machine.record_vote(category1, "Suzie", "Mary")
    machine.record_vote(category1, "Sam", "Bob")
    machine.record_vote(category2, "Jackie", "Sam")

    assert_equal machine.results.class, Hash
    assert_equal machine.results.keys, [category1, category2]

    assert_raises VotingMachine::InvalidCategory do
      machine.record_vote("Invalid category", "Sue", "John")
    end
  end
end
