# frozen_string_literal: true

# class GildedRose
class GildedRose
  
  def initialize(items)
    @items = items
  end
  
  def update_quality()
    @items.each do |item|
      item.sell_in -=1 if item.name != 'Sulfuras, Hand of Ragnaros' && item.sell_in > 0
      case item.name
      when 'Aged Brie'
        if item.sell_in == 0
          increment_double_quality(item)
        else
          increment_quality(item)
        end
      when 'Sulfuras, Hand of Ragnaros'
        item.sell_in = item.sell_in
        item.quality = item.quality
      when 'Backstage passes to a TAFKAL80ETC concert'
        if item.sell_in == 0
          item.quality = 0
        elsif item.sell_in <= 5
          five_or_less(item)
        elsif item.sell_in <= 10
          ten_or_less(item)
        else 
          item.quality +=1
        end
      when 'Conjured Mana Cake'
        decrement_double_quality(item)
      else
        if item.quality.positive?
          if item.sell_in.negative? && item.quality > 1
            decrement_double_quality(item)
          elsif item.sell_in.negative? && item.quality == 1
            decrement_quality(item)
          else 
            # decrement_qualitys
            decrement_quality(item)
            decrement_sell_in(item)
          end
        end
      end
    end  
  end

  def decrement_double_quality(item)
    item.quality -= 2
    item.quality = 0 if item.quality.negative?
  end

  def increment_quality(item)
    item.quality += 1
    item.quality = 50 if item.quality >= 50
  end

  def increment_double_quality(item)
    item.quality += 2
    item.quality = 50 if item.quality >= 50
  end
  
  def decrement_quality(item)
    item.quality -= 1
  end

  def decrement_double_quality(item)
    item.quality -= 2
    item.quality = 0 if item.quality.negative?
  end

  def decrement_sell_in(item)
    item.sell_in -= 1
    item.sell_in = 0 if item.sell_in.negative?
  end

  def ten_or_less(item)
    item.quality += 2
    item.quality = 50 if item.quality > 50
  end

  def five_or_less(item)
    item.quality += 3
    item.quality = 50 if item.quality > 50
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end