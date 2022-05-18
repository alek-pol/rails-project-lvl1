# frozen_string_literal: true

module HexletCode
  module TagsObject
    # Class tag form
    class Base
      attr_reader :name, :attributes, :value

      ATTRIBUTE_NAMES  = %i[type name value].freeze
      OTHER_ATTRIBUTES = %i[id class].freeze

      # Initializes a new {Tag object}.
      # @param [String, Symbol, nil] attr_name attribute name
      # @param [Hash] attributes
      # @option attributes [String, Symbol] :as Tag type (DSL input parameter)
      # @option attributes [Symbol, String] :class Tag class
      # @option attributes [String, Symbol] :content_value Tag value
      # @option attributes [String, Symbol] :type Tag type
      # @return [Hash]
      def initialize(attr_name, **attributes)
        @name       = attr_name
        @attributes = attributes
      end

      # @return [HexletCode::TagsObject::Base]
      def build
        extract_attributes

        self
      end

      private

      # Update attributes (remove unnecessary attributes)
      # @return [Hash]
      def extract_attributes
        @attributes = @attributes.slice(*self.class::ATTRIBUTE_NAMES)
      end
    end
  end
end
