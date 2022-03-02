# frozen_string_literal: true

# Form generator
module HexletCode
  autoload :Error, 'hexlet_code/errors.rb'
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :Form, 'hexlet_code/form.rb'
  autoload :VERSION, 'hexlet_code/version.rb'
  # Empty form generator
  # @param [Struct] object_data entity objects
  # @param [String] url url
  # @return [String]
  def self.form_for(object_data, url: '#')
    Tag.build(:form, action: url, method: :post) do
      # yield(Form.new(object_data)).rendering if block_given?
      yield(Form.new(object_data)).rendering if block_given?
    end
  end
end
