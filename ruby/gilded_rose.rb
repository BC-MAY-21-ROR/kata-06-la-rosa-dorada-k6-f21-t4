# frozen_string_literal: true

# class GildedRose
class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != 'Aged Brie' and item.name != 'Backstage passes to a TAFKAL80ETC concert'
        if item.quality > 0
          if item.name != 'Sulfuras, Hand of Ragnaros'
            item.quality -= 1
          end
        end
      else
        if item.quality < 50
          item.quality += 1
          if item.name == 'Backstage passes to a TAFKAL80ETC concert'
            if item.sell_in < 11
              if item.quality < 50
                item.quality += 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality += 1
              end
            end
          end
        end
      end
      if item.name != 'Sulfuras, Hand of Ragnaros'
        item.sell_in -= 1
      end
      if item.sell_in < 0
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality > 0
              if item.name != 'Sulfuras, Hand of Ragnaros'
                item.quality -= 1
              end
            end
          else
            item.quality = 0
          end
        else
          if item.quality < 50
            item.quality += 1
          end
        end
      end
    end
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






class Methods
  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def decrement_double_quality
    item.quality -= 2
  end

  def increment_quality
    item.quality += 1
  end

  def increment_double_quality
    item.quality += 2
  end

  def quality_limit
    item.quality <= 50 ? true : false
  end

  def ten_or_days_less
    item.quality += 2     
  end

  def five_or_less    
    item.quality += 3
  end

  def after_sell_in
    item.quality = 0    
  end

  def on_sell_limits
    item.quality > 0 ? true : false
  end
end
