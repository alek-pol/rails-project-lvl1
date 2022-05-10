# frozen_string_literal: true

# Html generation lib
module HexletCode
  # Generate Form
  class Form
    attr_reader :form_fields

    # @param [HexletCode::ObjectForm] object_data
    def initialize(object_data)
      @object_data = object_data
    end

    def to_string
      Tag.build(@object_data.name, **@object_data.attributes) { @object_data.value }
    end

    def rendering
      # Tag.build(@object_data.name, **@object_data.attributes) { @object_data.value }
    end
  end
end
