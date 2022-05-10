# frozen_string_literal: true

# Form generator
module HexletCode
  # Some form object class
  module ObjectTags
    autoload :Base, 'hexlet_code/object_tags/base'
    autoload :Input, 'hexlet_code/object_tags/input'
    autoload :Label, 'hexlet_code/object_tags/label'
    autoload :Text, 'hexlet_code/object_tags/text'
  end
end
