require './nameable_base_decorator'
require './person'

class CapitalizeDecorator < NameableBaseDecorator
  def correct_name
    @nameable_obj.correct_name.upcase
  end
end
