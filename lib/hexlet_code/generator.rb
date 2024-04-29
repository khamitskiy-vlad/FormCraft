# frozen_string_literal: true

module HexletCode
  class Generator
    attr_accessor :struct, :attributes

    def initialize(struct, attributes = {}, &)
      @struct = struct
      @attributes = attributes
      instance_eval(&)
    end

    def input
      puts self
    end
  end
end

# each_pair { |x, a| puts "#{x} => #{a}" }
# struct.members => [:name, :job, :gender]
