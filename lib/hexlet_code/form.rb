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
      @form_fields += send("as_#{params[:as] || :input}", { name: name, value: object_data.send(name) })
    rescue NoMethodError => e
      raise Error, e
    end

    def as_text(params = {})
      Tag.build(:textarea, cols: '20', rows: '40', name: params[:name]) { params[:value] }
    end

    def as_input(params = {})
      Tag.build(:input, type: :text, value: params[:value], name: params[:name])
    end
  end
end
