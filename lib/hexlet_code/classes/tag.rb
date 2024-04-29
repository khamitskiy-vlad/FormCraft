# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, options = {})
      paired_tags = %w[html head title body table label form span ul ol li p b div].freeze
      pair_body = yield if block_given?

      html_form = [].push tag_with(opening_tag(name), attributes(options))
      html_form.push pair_body, "</#{name}>" if paired_tags.include? name
      html_form.join
    end

    def self.tag_with(opening_tag, attr)
      array = [].push opening_tag
      array.push " #{attr}" unless attr.empty?
      array.push '>'
    end

    def self.opening_tag(name)
      "<#{name}"
    end

    def self.attributes(options)
      options.map do |key, value|
        "#{key}=\"#{value}\""
      end.join ' '
    end
  end
end
