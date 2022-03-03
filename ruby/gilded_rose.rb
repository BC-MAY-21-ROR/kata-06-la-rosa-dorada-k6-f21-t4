# frozen_string_literal: true

# class GildedRose
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1 if item.name != 'Sulfuras, Hand of Ragnaros' && item.sell_in.positive?
      items_case(item)
    end
  end

  def items_case(item)
    case item.name
    when 'Aged Brie' then cheese(item)
    when 'Sulfuras, Hand of Ragnaros' then sulfuras(item)
    when 'Backstage passes to a TAFKAL80ETC concert' then backstage(item)
    when 'Conjured Mana Cake' then decrement_double_quality(item)
    else
      item.quality -= item.sell_in.positive? ? 1 : 2
      min_quality_limit(item)
    end
  end

  def cheese(item)
    item.quality += item.sell_in.positive? ? 1 : 2
    item.quality = 50 if item.quality > 50
  end

  def sulfuras(item)
    item.sell_in = item.sell_in
    item.quality = item.quality
  end

  def backstage(item)
    if item.sell_in.zero?
      item.quality = 0
    elsif item.sell_in <= 10
      less_ten_or_five(item)
    else
      item.quality += 1
    end
  end

  def less_ten_or_five(item)
    item.quality += item.sell_in <= 5 ? 3 : 2
    max_quality_limit(item)
  end

  def max_quality_limit(item)
    item.quality = 50 if item.quality > 50
  end

  def min_quality_limit(item)
    item.quality = 0 if item.quality.negative?
  end

  def decrement_double_quality(item)
    item.quality -= 2
    min_quality_limit(item)
  end
end

# Class item
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
