# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def setup
    @user = Struct.new(:name, :job, :gender, keyword_init: true)
  end

  def test_that_it_has_a_version
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for_without_block
    user = @user.new name: 'Rob'

    assert_equal(HexletCode.form_for(user), '<form action="#" method="post"></form>')
    assert_equal(HexletCode.form_for(user, url: '/users'), '<form action="/users" method="post"></form>')
  end

  def test_form_for_with_block
    user = @user.new(name: 'rob', job: 'hexlet', gender: 'm')

    html = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal(html, file_fixture('sample_simple.html'))
  end

  def test_form_for_with_error
    user = @user.new(name: 'rob', job: 'hexlet')

    error = assert_raises(HexletCode::Error) do
      HexletCode.form_for user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end

    assert error.instance_of?(HexletCode::Error)
    assert_equal(error.message, "undefined method `age' for #<struct name=\"rob\", job=\"hexlet\", gender=nil>")
  end
end
