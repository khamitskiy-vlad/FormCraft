# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  autoload(:Tag, './hexlet_code/tag')
end

puts HexletCode::Tag.build('br')
# <br>

puts HexletCode::Tag.build('img', src: 'path/to/image')
# <img src="path/to/image">

puts HexletCode::Tag.build('input', type: 'submit', value: 'Save')
# <input type="submit" value="Save">

# Для парных тегов тело передается как блок
puts HexletCode::Tag.build('label') { 'Email' }
# <label>Email</label>

puts HexletCode::Tag.build('label', for: 'email') { 'Email' }
# <label for="email">Email</label>

puts HexletCode::Tag.build('div')
# <div></div>
