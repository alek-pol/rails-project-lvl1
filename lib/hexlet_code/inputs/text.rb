# frozen_string_literal: true

module HexletCode
  module Inputs
    # Class build text
    class Text
      def self.build(params = {})
        param = params[:params]
        attributes = { name: params[:name], cols: param[:cols] ||= '20', rows: param[:rows] ||= '40' }

        Tag.build(:textarea, **attributes) { params[:value] }
      end
    end
  end
end
