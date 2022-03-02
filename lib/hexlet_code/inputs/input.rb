# frozen_string_literal: true

module HexletCode
  module Inputs
    # Class build text
    class Input
      def self.build(params = {})
        Tag.build(:input, type: :text, name: params[:name], value: params[:value], **params[:params])
      end
    end
  end
end
