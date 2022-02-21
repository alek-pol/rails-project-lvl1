# frozen_string_literal: true

require_relative 'hexlet_code/errors'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/version'

# Form generator
module HexletCode
  # Empty form generator
  # @param [Struct] _ entity objects
  # @param [String] url url
  # @return [String]
  def self.form_for(_, url: '#')
    Tag.build(:form, action: url, method: :post)
  end
end
