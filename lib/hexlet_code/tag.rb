# frozen_string_literal: true

module HexletCode
  # Tag generate class
  class Tag
    # Empty element list from:  http://htmlbook.ru/samhtml5/sintaksis-html5
    SINGLE_TAGS = %w[area base br col command embed hr img input keygen link meta param source track wbr].freeze

    class << self
      # Build tag
      # @param [String, Symbol] name Tag name
      # @param [Hash] attributes Tag params
      # @param [Proc] block
      # @return [String (frozen)]
      def build(name, **attributes, &block)
        open_tag = "<#{name}#{prepare_attributes(attributes)}>"
        return open_tag if SINGLE_TAGS.include? name.to_s

        "#{open_tag}#{build_value(yield) if block}</#{name}>"
      end

      # Transform nested tagsObject to tags
      # @param [Array, String (frozen)] value
      # @return [String (frozen)]
      def build_value(value)
        return value unless value.is_a?(Array)

        value.map { |node| build(node.name, **node.attributes) { node.value } }.join
      end

      # Convert hash attributes to string
      # @param [Hash] attributes
      # @return [String]
      def prepare_attributes(attributes)
        attributes.map { |name, value| %( #{name}="#{value}") if value }.join
      end
    end
  end
end
