class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    dishes << dish
  end

  def all_from_category(category)
    dishes
      .select { |dish| dish.category == category }
      .sort_by(&:name)
  end

  def menu
    dishes.each_with_object({}) do |dish, menu|
      menu[dish.category] = all_from_category(dish.category)
    end
  end

  def ratio(category)
    (all_from_category(category).count / dishes.count.to_f * 100).round(2)
  end
end
