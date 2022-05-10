# frozen_string_literal: true

module HexletCode
  module ObjectTags
    # Class tag form
    class Base
      attr_reader :name, :attributes, :value

      ATTRIBUTE_NAMES = %i[type name value].freeze
      OTHER_ATTRIBUTES = %i[id class].freeze
      # OTHER_ATTRIBUTES = %i[id class placeholder readonly required].freeze

      def initialize(attr_name, **attributes)
        @name       = attr_name
        @attributes = attributes
      end

      def build
        clean_attributes

        self
      end

      private

      def clean_attributes
        # @attributes = @attributes.select { |key, _| self.class::ATTRIBUTE_NAMES.include?(key) }
        @attributes = @attributes.slice(*self.class::ATTRIBUTE_NAMES)
      end

      def rename_key(current_key, new_key)
        @attributes[new_key] = @attributes.delete(current_key) if @attributes[current_key]
      end
    end
  end
end
