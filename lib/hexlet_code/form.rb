# frozen_string_literal: true

# Html generation lib
module HexletCode
  autoload :Inputs, 'hexlet_code/inputs'
  # Generate fields for Form
  class Form
    attr_reader :object_data

    # @param [Hash] object_data
    def initialize(object_data)
      @object_data = object_data
      @form_fields = []
    end

    # @param [Symbol] name
    # @param [Hash] params
    # @return [HexletCode::Form]
    def input(name, **params)
      label(name)

      class_name = (params[:as] || :input).to_s.capitalize
      @form_fields << Inputs.const_get(class_name).build({ name: name, value: object_data.send(name), params: params })
      self
    end

    # @param [Symbol|String] value
    # @return [HexletCode::Form]
    def submit(value = :Save)
      @form_fields << Tag.build(:input, type: :submit, value: value, name: :commit)
      self
    end

    # @param [Array]
    # @return [String]
    def rendering
      @form_fields.join
    end

    private

    # @param [Symbol] name
    def label(name)
      @form_fields << Tag.build(:label, for: name) { name.capitalize }
    end
  end
end
