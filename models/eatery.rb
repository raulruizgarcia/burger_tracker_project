require_relative '../db/sql_runner'
require_relative './deal'

class Eatery

  attr_accessor :name
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end

  def save()
    sql = '
      INSERT INTO eateries ( name )
      VALUES
      ( $1 )
      RETURNING *;
    '
    values = [@name]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = '
      DELETE FROM eateries;
    '
    SqlRunner.run(sql)
  end

  def deals()
    sql = '
      SELECT * FROM deals WHERE eatery_id = $1;
    '
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map(){|hash| Deal.new(hash)}
  end

  def burgers()
    sql = '
      SELECT * FROM burgers WHERE eatery_id = $1;
    '
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map(){|hash| Burger.new(hash)}
  end

end
