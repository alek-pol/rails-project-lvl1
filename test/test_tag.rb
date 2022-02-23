# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  TAG_TESTS = [
    { name: 'br', tag: '<br>' },
    { name: :hr, tag: '<hr>' },
    { name: 'img', attribute: { src: 'path/to/image' }, tag: '<img src="path/to/image">' },
    { name: 'input', attribute: { type: 'submit', value: 'Save' }, tag: '<input type="submit" value="Save">' },
    { name: 'div', tag: '<div></div>' },
    { name: 'label', block: 'Email', tag: '<label>Email</label>' },
    { name: 'label', attribute: { for: 'email' }, block: 'Email', tag: '<label for="email">Email</label>' }
  ].freeze

  def test_build_single_tag
    assert HexletCode::Tag.build('br').instance_of?(String)

    TAG_TESTS.each do |test|
      assert_equal(test[:tag], HexletCode::Tag.build(test[:name], **(test[:attribute] || {})) { test[:block] })
    end
  end
end
