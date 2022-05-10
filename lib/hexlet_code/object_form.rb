# frozen_string_literal: true

# Form generator
module HexletCode
  autoload :ObjectTags, 'hexlet_code/object_tags.rb'
  # Some form object class
  class ObjectForm
    attr_reader :value, :name, :attributes

    DEFAULT_FORM_ATTRIBUTES = {
      url:    { name: :action, value: '#' },
      method: { value: :post }
    }.freeze

    DEFAULT_INPUT_ATTRIBUTES = {
      submit: {
        type:  :submit,
        value: 'Save'
      },
      reset:  {
        type:  :reset,
        value: 'Clear'
      }
    }.freeze

    # @param [Struct] object
    # @param [Hash, nil] attributes
    # @return [HexletCode::ObjectForm]
    def initialize(object = {}, **attributes, &block)
      @name   = :form
      @object = object
      form_defaults(attributes)
      @value = []

      instance_eval(&block) if block_given?
    end

    # @param [Symbol] attr_name
    # @param [Hash] params
    def input(attr_name = nil, **params)
      class_name = (params[:as] || :input).to_s.capitalize

      value << ObjectTags::Label.new(attr_name, **params).build
      value << ObjectTags.const_get(class_name).new(attr_name, **params, content_value: @object.send(attr_name)).build
    end

    def submit(attr_name = nil, **attributes)
      attr_name ||= { submit: :commit, reset: :desist }[__callee__]
      DEFAULT_INPUT_ATTRIBUTES[__callee__].each { |key, params| attributes[key] ||= params }

      value << ObjectTags::Input.new(attr_name, **attributes).build
    end

    alias reset submit

    private

    # Default form attributes
    # @param [Hash] attributes
    # @return [Hash]
    def form_defaults(attributes)
      @attributes = DEFAULT_FORM_ATTRIBUTES.map.to_h do |key, params|
        [params[:name] || key, attributes[key] ||= params[:value]]
      end
    end
  end
end
