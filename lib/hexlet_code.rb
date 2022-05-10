# frozen_string_literal: true

# Form generator
module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :Form, 'hexlet_code/form.rb'
  autoload :ObjectForm, 'hexlet_code/object_form.rb'

  autoload :VERSION, 'hexlet_code/version.rb'
  # Empty form generator
  # @param [Struct] obj entity objects
  # @param [Hash] attributes
  # @return [String]
  def self.form_for(obj, **attributes, &block)
    tags_data = ObjectForm.new(obj, **attributes, &block)

    # puts Form.new(tags_data).rendering
    puts Form.new(tags_data).to_string

    Form.new(tags_data).to_string
  end
end
