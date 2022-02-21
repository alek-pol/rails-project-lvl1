# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def setup
    @user = Struct.new(:name, :job, keyword_init: true).new name: 'Rob'
  end

  def test_that_it_has_a_version
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for
    assert_equal(HexletCode.form_for(@user), '<form action="#" method="post"></form>')
    assert_equal(HexletCode.form_for(@user, url: '/users'), '<form action="/users" method="post"></form>')
  end
end
