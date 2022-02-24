# frozen_string_literal: true

module HexletCode
  # Generate fields for Form
  class Form
    attr_reader :object_data

    def initialize(object_data)
      @object_data = object_data
      @form_fields = ''
    end

    def input(name, **params)
      label(name)

      @form_fields += send("as_#{params[:as] || :input}", { name: name, value: object_data.send(name), params: params })
    rescue NoMethodError
      raise NoMethodError
    end

    def as_text(params = {})
      param = params[:params]
      attributes = { name: params[:name], cols: param[:cols] ||= '20', rows: param[:rows] ||= '40' }

      Tag.build(:textarea, **attributes) { params[:value] }
    end

    def as_input(params = {})
      Tag.build(:input, type: :text, name: params[:name], value: params[:value], **params[:params])
    end

    def label(name)
      @form_fields += Tag.build(:label, for: name) { name.capitalize }
    end

    def submit(value = :Save)
      @form_fields += Tag.build(:input, type: :submit, value: value, name: :commit)
    end
  end
end
