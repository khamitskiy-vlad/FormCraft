# frozen_string_literal: true

module HexletCode
  module Tag
    UNPAIRED = %w[area base br col embed hr img input link meta source].freeze

    def self.build(name, options = {})
      pair_body = yield if block_given?

      html_form = [].push open_tag_with(name, attributes(options))
      html_form.push pair_body, "</#{name}>" unless UNPAIRED.include? name
      html_form.join
    end

    def self.open_tag_with(name, attr)
      array = [].push "<#{name}"
      array.push " #{attr}" unless attr.empty?
      array.push '>'
    end

    def self.attributes(options)
      options.map do |key, value|
        "#{key}=\"#{value}\""
      end.join ' '
    end
  end
end
