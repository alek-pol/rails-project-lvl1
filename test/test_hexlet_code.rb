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

    assert_equal(HexletCode.form_for(user), file_fixture('sample_action_sh.html'))
    assert_equal(HexletCode.form_for(user, url: '/users'), file_fixture('sample_action_user.html'))
  end

  def test_form_for_with_input
    user = @user.new(name: 'rob', job: 'hexlet', gender: 'm')

    html = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal(html, file_fixture('sample_simple.html'))
  end

  def test_form_for_with_submit
    user = @user.new(job: 'hexlet')

    html = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal(html, file_fixture('label_save.html'))
  end

  def test_form_for_with_class
    user = @user.new(name: 'rob', job: 'hexlet')

    html = HexletCode.form_for user, url: '/users' do |f|
      f.input :name
      f.input :job, class: 'test'
      f.submit 'Submit This Form'
    end

    assert_equal(html, file_fixture('with_class.html'))
  end

  def test_form_for_with_error
    user = @user.new(name: 'rob', job: 'hexlet')

    error = assert_raises(NoMethodError) do
      HexletCode.form_for user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end

    assert error.instance_of?(NoMethodError)
  end
end
