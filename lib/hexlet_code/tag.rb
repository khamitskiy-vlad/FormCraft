# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, options = {})
      paired_tags = %w[html head title body table label form span ul ol li p b div]
      opening_tag = opening_tag(name)
      attributes = attributes(options)
      pair_body = yield if block_given?

      html_form = [] << tag_with_attributes_clouser(opening_tag, attributes)

      html_form << pair_body << "</#{name}>" if paired_tags.include?(name)

      html_form.join
    end

    def self.tag_with_attributes_clouser(open, attr)
      array = [] << open
      array << " #{attr}" unless attr.empty?
      array << '>'
    end

    def self.opening_tag(name)
      "<#{name}"
    end

    def self.attributes(options)
      attr = []
      options.map do |key, value|
        attr << "#{key}=\"#{value}\""
      end
      attr.join(' ')
    end
  end
end
