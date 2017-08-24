class BurgerDeal

  attr_reader :id, :burger_id, :deal_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @burger_id = params['burger_id'].to_i
    @deal_id = params['deal_id'].to_i
  end

  def save()
    sql = '
      INSERT INTO burger_deals ( burger_id, deal_id )
      VALUES
      ( $1, $2 )
      RETURNING *;
    '
    values = [@burger_id, @deal_id]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

end
