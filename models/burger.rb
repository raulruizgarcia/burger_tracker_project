require_relative '../db/sql_runner'
require 'pry'

class Burger

  attr_accessor :name
  attr_reader :id, :eatery_id, :price

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @eatery_id = params['eatery_id']
    @price = params['price'].to_f
  end

  def save()
    sql = '
      INSERT INTO burgers ( name, eatery_id, price )
      VALUES
      ( $1, $2, $3 )
      RETURNING *;
    '
    values = [@name, @eatery_id, @price]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = '
      DELETE FROM burgers;
    '
    SqlRunner.run(sql)
  end

  def deals()
    sql = '
      SELECT deals.*
      FROM deals
      INNER JOIN burger_deals ON deals.id = burger_deals.deal_id
      WHERE burger_id = $1;
    '
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map(){|hash| Deal.new(hash)}
  end

  def apply_deal(deal_id)
    sql = '
    SELECT deals.*
    FROM deals
    INNER JOIN burger_deals ON deals.id = burger_deals.deal_id
    WHERE burger_id = $1 AND deal_id = $2;
    '
    values = [@id, deal_id]
    result = SqlRunner.run(sql, values)
    pct_off = result[0]["pct_off"].to_f
    # binding.pry
    return (@price - (pct_off * @price) / 100).round(2)
  end

  def eatery()
    sql = '
      SELECT * FROM eateries
      WHERE id = $1;
    '
    result = SqlRunner.run(sql, [@eatery_id])
    return Eatery.new(result[0])
  end

  def delete()
    sql = '
      DELETE FROM burgers
      WHERE id = $1;
    '
    SqlRunner.run(sql, [@id])
  end

  def self.find_by_id(id)
    sql = '
      SELECT * FROM burgers
      WHERE id = $1;
    '
    values = [id]
    result = SqlRunner.run(sql, values)
    return Burger.new(result[0])
  end

end
