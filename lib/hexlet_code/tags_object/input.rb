# frozen_string_literal: true

module HexletCode
  module TagsObject
    # Build :input tag
    class Input < Base
      INPUT_ATTRIBUTES = %i[accept accesskey align alt autocomplete autofocus border checked disabled form formaction
                            formenctype formmethod formnovalidate formtarget list max maxlength min multiple pattern
                            placeholder readonly required size src step tabindex].freeze

      ATTRIBUTE_NAMES = [:name, :type, :value, *OTHER_ATTRIBUTES, *INPUT_ATTRIBUTES].freeze

      # @return [HexletCode::TagsObject::Base]
      def build
        @attributes[:name] = @name
        @attributes[:type] ||= :text
        @attributes[:value] = @attributes[:content_value]
        @name = :input

        super
      end
    end
  end
end
