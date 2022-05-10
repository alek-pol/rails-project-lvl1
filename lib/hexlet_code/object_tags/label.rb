# frozen_string_literal: true

module HexletCode
  module ObjectTags
    # Build :label tag
    class Label < Base
      ATTRIBUTE_NAMES = %i[for].freeze

      def build
        @value            = name.to_s.capitalize
        @attributes[:for] = @name
        @name             = :label

        super
      end
    end
  end
end
