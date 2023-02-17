require './nameable_base_decorator'
require './person'

class TrimmerDecorator < NameableDecorator
  def correct_name
    name = @nameable_obj.correct_name

    if name.length <= 10
      name
    else
      name[0...10]
    end
  end
end
