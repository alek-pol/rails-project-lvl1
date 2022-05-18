# frozen_string_literal: true

# Html generation lib
module HexletCode
  # Generate Form
  class Form
    attr_reader :form_fields

    # @param [HexletCode::FormObject] object_data
    # @return [HexletCode::FormObject]
    def initialize(object_data)
      @object_data = object_data
    end

    # Collect tags in a string without separators
    # @return [String]
    def to_string
      Tag.build(@object_data.name, **@object_data.attributes) { @object_data.value }
    end

    # Collect tags in a string with separators "\n"
    # @return [String]
    def rendering
      Tag.build(@object_data.name, **@object_data.attributes) do
        tags = @object_data.value.map do |tag_object|
          "\n  #{Tag.build(tag_object.name, **tag_object.attributes) { tag_object.value }}"
        end.join

        "#{tags}\n"
      end
    end
  end
end
