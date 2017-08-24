require_relative '../db/sql_runner'

class Burger

  attr_accessor :name
  attr_reader :id, :eatery_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @eatery_id = params['eatery_id']
  end

  def save()
    sql = '
      INSERT INTO burgers ( name, eatery_id )
      VALUES
      ( $1, $2 )
      RETURNING *;
    '
    values = [@name, @eatery_id]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = '
      DELETE FROM burgers;
    '
    SqlRunner.run(sql)
  end

end
