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
end

require './lib/dish'
potluck = Potluck.new('7-13-18')
couscous_salad = Dish.new('Couscous Salad', :appetizer)
summer_pizza = Dish.new('Summer Pizza', :appetizer)
roast_pork = Dish.new('Roast Pork', :entre)
cocktail_meatballs = Dish.new('Cocktail Meatballs', :entre)
candy_salad = Dish.new('Candy Salad', :dessert)
bean_dip = Dish.new('Bean Dip', :appetizer)
potluck.add_dish(couscous_salad)
potluck.add_dish(summer_pizza)
potluck.add_dish(roast_pork)
potluck.add_dish(cocktail_meatballs)
potluck.add_dish(candy_salad)
potluck.add_dish(bean_dip)
# pp potluck.all_from_category(:entre)
pp potluck.menu
# => {:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entres=>["Cocktail Meatballs", "Roast Pork"],:desserts=>["Candy Salad"]}
# potluck.ratio(:appetizer)
