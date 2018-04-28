require "test_helper"

class OfacSdnTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil OfacSdn::VERSION
  end

  def test_can_get_publish_date
    refute_nil OfacSdn::Read.publish_date
  end

  def test_can_get_record_count
    refute_nil OfacSdn::Read.record_count
  end

  def test_can_output_sdn_hash
    hash = OfacSdn::Read.call
    refute_nil hash.keys
    assert_equal(hash.keys.count, 10)
  end
end
