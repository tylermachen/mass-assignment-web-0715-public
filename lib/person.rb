# meta programming below!
class Person
  def initialize(attributes)
    attributes.each do |key, value|
      # instance_variable_set("@#{key}", value)
      self.send("#{key}=", value)
    end
  end

  # create getters:
  # def name
  #   @name
  # end
  [:name, :birthday, :hair_color, :eye_color, :height,
    :weight, :handed, :complexion, :t_shirt_size, :wrist_size,
    :glove_size, :pant_length, :pant_width].each do |meth|
    define_method "#{meth}" do
      instance_variable_get("@#{meth}")
    end

    # create setters:
    # def name=(new_name)
    #   @name = new_name
    # end
    define_method "#{meth}=" do |new_value|
      instance_variable_set("@#{meth}", new_value)
    end
  end
end
