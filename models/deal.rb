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

end
