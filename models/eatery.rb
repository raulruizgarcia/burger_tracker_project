require_relative '../db/sql_runner'
require_relative './deal'

class Eatery

  attr_accessor :name, :logo_url
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @logo_url = params['logo_url']
  end

  def save()
    sql = '
      INSERT INTO eateries ( name, logo_url )
      VALUES
      ( $1, $2 )
      RETURNING *;
    '
    values = [@name, @logo_url]
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

  def self.all()
  sql = '
    SELECT * FROM eateries;
  '
  result = SqlRunner.run(sql)
  return result.map(){|hash| Eatery.new(hash)}
  end

  def self.find_by_id(id)
    sql = '
      SELECT * FROM eateries
      WHERE id = $1;
    '
    values = [id]
    result = SqlRunner.run(sql, values)
    return Eatery.new(result[0])
  end

  def self.find_by_name(name)
    sql = '
      SELECT * FROM eateries
      WHERE name = $1;
    '
    values = [name]
    result = SqlRunner.run(sql, values)
    return Eatery.new(result[0])
  end

  def update()
    sql = '
      UPDATE eateries
      SET name = $1, logo_url = $2
      WHERE id = $3;
    '
    values = [@name, @logo_url, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = '
      DELETE FROM eateries
      WHERE id = $1;
    '
    SqlRunner.run(sql, [@id])
  end

end
