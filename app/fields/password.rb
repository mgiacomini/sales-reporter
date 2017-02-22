require "administrate/field/base"

module Field
  class Password < Administrate::Field::Base
    def to_s
      '*' * 5
    end
  end
end