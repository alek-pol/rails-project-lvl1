# frozen_string_literal: true

# Form generator
module HexletCode
  autoload :TagsObject, 'hexlet_code/tags_object.rb'
  # Abstract Form structure
  class FormObject
    attr_reader :value, :name, :attributes

    DEFAULT_FORM_ATTRIBUTES = {
      url: { name: :action, value: '#' },
      method: { value: :post }
    }.freeze

    DEFAULT_INPUT_ATTRIBUTES = {
      submit: {
        value: 'Save',
        name: :commit
      },
      reset: {
        value: 'Cancel',
        name: :reset
      }
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
      form_defaults(attributes)
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

      value << TagsObject::Label.new(attr_name, **params).build
      value << TagsObject.const_get(class_name).new(attr_name, **params, content_value: @object.send(attr_name)).build
    end

    # @param attr_value [String, nil]
    # @param params [Hash]
    # @option params [Symbol, String] :type Tag type
    # @return [Array]
    def submit(attr_value = nil, **params)
      defaults = DEFAULT_INPUT_ATTRIBUTES[__callee__]

      attr_value    ||= defaults[:value]
      params[:type] ||= __callee__
      attr_name     = params[:name] || defaults[:name]

      value << TagsObject::Input.new(attr_name, **params, content_value: attr_value).build
    end

    alias reset submit

    private

    # Fill form attributes with default values
    # @param [Hash] attributes
    # @return [Hash{Symbol->Symbol}]
    def form_defaults(attributes)
      @attributes = DEFAULT_FORM_ATTRIBUTES.map.to_h do |key, params|
        [params[:name] || key, attributes[key] ||= params[:value]]
      end
    end
  end
end
