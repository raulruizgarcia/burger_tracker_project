require_relative '../db/sql_runner'


class Deal

  attr_accessor :name, :day_of_the_week
  attr_reader :id, :eatery_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @day_of_the_week = params['day_of_the_week']
    @eatery_id = params['eatery_id']
  end

  def save()
    sql = '
      INSERT INTO deals ( name, eatery_id, day_of_the_week)
      VALUES
      ( $1, $2, $3 )
      RETURNING *;
    '
    values = [@name, @eatery_id, day_of_the_week]
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

end
