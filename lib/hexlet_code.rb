# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'

module HexletCode
  class Error < StandardError; end
end

# HexletCode::Tag.build('br')
# # <br>

# HexletCode::Tag.build('img', src: 'path/to/image')
# # <img src="path/to/image">

# HexletCode::Tag.build('input', type: 'submit', value: 'Save')
# # <input type="submit" value="Save">

# # Для парных тегов тело передается как блок
# HexletCode::Tag.build('label') { 'Email' }
# # <label>Email</label>

# HexletCode::Tag.build('label', for: 'email') { 'Email' }
# # <label for="email">Email</label>

# HexletCode::Tag.build('div')
# # <div></div>
