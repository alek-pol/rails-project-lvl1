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

      @form_fields += send("as_#{params[:as] || :input}", { name: name, value: object_data.send(name) }.merge(params))
    rescue NoMethodError => e
      raise Error, e
    end

    def as_text(params = {})
      attributes = { cols: params[:cols] || '20', rows: params[:rows] || '40', name: params[:name] }

      Tag.build(:textarea, **attributes) { params[:value] }
    end

    def as_input(params = {})
      Tag.build(:input, name: params[:name], type: :text, value: params[:value])
    end

    def label(name)
      @form_fields += Tag.build(:label, for: name) { name.capitalize }
    end

    def submit(value = :Save)
      @form_fields += Tag.build(:input, name: :commit, type: :submit, value: value)
    end
  end
end
