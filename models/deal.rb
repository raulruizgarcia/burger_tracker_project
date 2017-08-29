require_relative '../db/sql_runner'


class Deal

  attr_accessor :name, :day_of_the_week
  attr_reader :id, :eatery_id, :pct_off

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @day_of_the_week = params['day_of_the_week']
    @eatery_id = params['eatery_id']
    @pct_off = params['pct_off'].to_i
  end

  def save()
    sql = '
      INSERT INTO deals ( name, eatery_id, day_of_the_week, pct_off)
      VALUES
      ( $1, $2, $3, $4 )
      RETURNING *;
    '
    values = [@name, @eatery_id, @day_of_the_week, @pct_off]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = '
      DELETE FROM deals;
    '
    SqlRunner.run(sql)
  end

  def burgers()
    sql = '
      SELECT burgers.*
      FROM burgers
      INNER JOIN burger_deals ON burgers.id = burger_deals.burger_id
      WHERE deal_id = $1;
    '
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map(){|hash| Burger.new(hash)}
  end

  def self.find_by_id(id)
    sql = '
      SELECT * FROM deals
      WHERE id = $1;
    '
    values = [id]
    result = SqlRunner.run(sql, values)
    return Deal.new(result[0])
  end

  def eatery()
    sql = '
      SELECT * FROM eateries
      WHERE id = $1;
    '
    result = SqlRunner.run(sql, [@eatery_id])
    return Eatery.new(result[0])
  end

  def self.find_by_name(name)
    sql = '
      SELECT * FROM deals
      WHERE name = $1;
    '
    values = [name]
    result = SqlRunner.run(sql, values)
    return Deal.new(result[0])
  end

  def self.find_by_dow(dow)
    dow_string = case dow
      when 0
        "Sunday"
      when 1
        "Monday"
      when 2
        "Tuesday"
      when 3
        "Wednesday"
      when 4
        "Thursday"
      when 5
        "Friday"
      when 6
        "Saturday"
    end
    sql = '
      SELECT * FROM deals
      WHERE day_of_the_week = $1
    '
    result = SqlRunner.run(sql,[dow_string])
    return result.map(){|hash| Deal.new(hash)}
  end

end
