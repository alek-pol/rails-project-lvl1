# frozen_string_literal: true

module HexletCode
  module TagsAttributeBuilder
    # Class tag form
    class Text < Base
      ATTRIBUTE_NAMES = [:name, :cols, :rows, *OTHER_ATTRIBUTES].freeze

      # @return [HexletCode::TagsObject::Base]
      def build
        @attributes[:name] = @name
        @attributes[:cols] ||= '20'
        @attributes[:rows] ||= '40'

        @name  = :textarea
        @value = @attributes[:content_value]

        super
      end
    end
  end
end
