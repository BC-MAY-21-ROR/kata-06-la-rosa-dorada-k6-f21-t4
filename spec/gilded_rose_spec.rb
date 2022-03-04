# frozen_string_literal: true

require 'rspec'
require_relative '../ruby/gilded_rose'

cheese = Item.new(name = 'Aged Brie', sell_in = 2, quality = 0)
gilded_cheese = GildedRose.new(cheese)

sulfuras = Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = 2, quality = 80)
gilded_sulfuras = GildedRose.new(sulfuras)

less_ten_or_five = Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 5, quality = 20)
less_ten_or_five_test = GildedRose.new(less_ten_or_five)

conjured = Item.new(name = 'Conjured Mana Cake', sell_in = 2, quality = 10)
gilded_conjured = GildedRose.new(conjured)

backstage = Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 49)
gilded_backstage = GildedRose.new(backstage)

backstage2 = Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 2, quality = 1)
gilded_backstage2 = GildedRose.new(backstage2)

describe GildedRose do
  describe 'Methods' do
    it 'The Cheese method increment the quality' do
      gilded_cheese.cheese(cheese)
      expect(cheese.quality).to eq 1
    end

    it 'The Sulfuras method do not change the values' do
      gilded_sulfuras.sulfuras(sulfuras)
      expect(sulfuras.quality).to eq 80
    end

    it 'Add 3 to the qualitiy because it has a 5 on sellin' do
      less_ten_or_five_test.less_ten_or_five(less_ten_or_five)
      expect(less_ten_or_five.quality).to eq 23
    end

    it 'decrement twice the quality' do
      gilded_conjured.decrement_double_quality(conjured)
      expect(conjured.quality).to eq 8
    end

    it 'The value do not change' do
      gilded_backstage.max_quality_limit(backstage)
      expect(backstage.quality).not_to eq 50
    end

    it 'Quality cant be less than 1' do
      gilded_backstage2.min_quality_limit(backstage2)
      expect(backstage2.quality).to eq 1
    end
  end
end
