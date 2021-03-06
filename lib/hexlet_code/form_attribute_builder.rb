# frozen_string_literal: true

# Form generator
module HexletCode
  autoload :TagsAttributeBuilder, 'hexlet_code/tags_attribute_builder.rb'
  # Abstract Form structure
  class FormAttributeBuilder
    attr_reader :value, :name, :attributes

    DEFAULT_FORM_ATTRIBUTES = {
      url: { name: :action, value: '#' },
      method: { value: :post }
    }.freeze

    DEFAULT_SUBMIT_ATTRIBUTES = {
      submit: { value: 'Save', name: :commit }
    }.freeze

    # @param [Struct] object Entity objects, contains data to fill a form
    # @param [Hash] attributes Form parameters
    # @option attributes [String] :url
    # @option attributes [String] :method
    # @param [Proc] block
    # @return [HexletCode::FormObject]
    def initialize(object = {}, **attributes, &block)
      @name   = :form
      @object = object
      fill_default_form_attributes!(attributes)
      @value = []

      instance_eval(&block) if block
    end

    # @param [Symbol] attr_name
    # @param [Hash] params
    # @option params [Symbol, String] :as Tag type (DSL input parameter)
    # @option params [Symbol, String] :class Tag class
    # @return [Array]
    def input(attr_name, **params)
      class_name = (params[:as] || :input).to_s.capitalize

      value << TagsAttributeBuilder::Label.new(attr_name, **params).build

      params[:content_value] = @object.send(attr_name)
      value << TagsAttributeBuilder.const_get(class_name).new(attr_name, **params).build
    end

    # @param attr_value [String, nil]
    # @param params [Hash]
    # @option params [Symbol, String] :type Tag type
    # @return [Array]
    def submit(attr_value = nil, **params)
      defaults = DEFAULT_SUBMIT_ATTRIBUTES[:submit]

      attr_value    ||= defaults[:value]
      params[:type] ||= :submit
      attr_name     = params[:name] || defaults[:name]

      value << TagsAttributeBuilder::Input.new(attr_name, **params, content_value: attr_value).build
    end

    private

    # Fill form attributes with default values
    # @param [Hash] attributes
    # @return [Hash{Symbol->Symbol}]
    def fill_default_form_attributes!(attributes)
      @attributes = DEFAULT_FORM_ATTRIBUTES.map.to_h do |key, params|
        [params[:name] || key, attributes[key] ||= params[:value]]
      end
    end
  end
end
