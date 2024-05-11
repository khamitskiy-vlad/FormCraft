# frozen_string_literal: true

module HexletCode
  module Tag
    UNPAIRED = %i[area base br col embed hr img input link meta source].freeze

    def self.build(name, options = {})
      pair_body = yield if block_given?
      html_form = "<#{name}#{attributes(options)}>"
      html_form << "\n" if name == :form
      html_form << pair_body.to_s << "</#{name}>" unless UNPAIRED.include? name
      html_form
    end

    def self.attributes(options)
      options.map do |key, value|
        " #{key}=\"#{value}\""
      end.join
    end
  end
end
