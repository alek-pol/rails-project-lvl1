# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version
    refute_nil ::HexletCode::VERSION
  end
end