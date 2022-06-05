# frozen_string_literal: true

# Form generator
module HexletCode
  # Abstract Tag structure
  module TagsAttributeBuilder
    autoload :Base, 'hexlet_code/tags_attribute_builder/base'
    autoload :Input, 'hexlet_code/tags_attribute_builder/input'
    autoload :Label, 'hexlet_code/tags_attribute_builder/label'
    autoload :Text, 'hexlet_code/tags_attribute_builder/text'
  end
end
