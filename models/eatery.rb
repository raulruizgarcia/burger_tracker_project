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

end
