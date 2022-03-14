# frozen_string_literal: true

module HexletCode
  # Tag generate class
  class Tag
    # Empty element list from:  http://htmlbook.ru/samhtml5/sintaksis-html5
    SINGLE_TAGS = %w[area base br col command embed hr img input keygen link meta param source track wbr].freeze

    class << self
      # Build tag
      # @param [String|Symbol] name Tag name
      # @param [Hash] attributes params
      # @return [String]
      def build(name, **attributes, &block)
        result = "<#{name}#{prepare_attributes(attributes)}>"
        return result if SINGLE_TAGS.include? name.to_s

        "#{result}#{block.call if block_given?}</#{name}>"
      end

      # Convert hash attributes to string
      # @param [Hash] attributes
      # @return [String]
      def prepare_attributes(attributes)
        attributes.map { |name, value|  %( #{name}="#{value}") if value }.join
      end
    end
  end
end
