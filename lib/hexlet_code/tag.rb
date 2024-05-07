# frozen_string_literal: true

module HexletCode
  module Tag
    UNPAIRED = %w[area base br col embed hr img input link meta source].freeze

    def self.build(name, options = {})
      pair_body = yield if block_given?
      html_form = open_tag_with(name, attributes(options))
      html_form << "\n" if name == 'form'
      html_form << pair_body.to_s << "</#{name}>" unless UNPAIRED.include? name
      html_form
    end

    def self.open_tag_with(name, attrs)
      "<#{name}#{attrs}>"
    end

    def self.attributes(options)
      options.map do |key, value|
        " #{key}=\"#{value}\""
      end.join
    end
  end
end
