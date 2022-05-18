# frozen_string_literal: true

# Form generator
module HexletCode
  # Abstract Tag structure
  module TagsObject
    autoload :Base, 'hexlet_code/tags_object/base'
    autoload :Input, 'hexlet_code/tags_object/input'
    autoload :Label, 'hexlet_code/tags_object/label'
    autoload :Text, 'hexlet_code/tags_object/text'
  end
end
