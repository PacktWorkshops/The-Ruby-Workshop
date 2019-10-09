require 'minitest/autorun'
require './exercise'
class TestExercise < Minitest::Test

  def test_payment_type
    assert_equal PaymentTypes.all.length, PaymentTypes::DATA.length
  end

  def test_interrogation_methods
    pt = PaymentTypes.new(1, :wire, "Wire")
    assert_equal pt.wire?, true
  end

  def test_namespace
    assert_equal Report.test_namespace, "Report::User"
    assert_equal Report.test_global, "Global User"
  end
end
