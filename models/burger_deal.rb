require_relative '../db/sql_runner'

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
    return false if duplicated?
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = '
      DELETE FROM burger_deals;
    '
    SqlRunner.run(sql)
  end

  def duplicated?()
    sql = '
      SELECT * FROM burger_deals
      WHERE burger_id = $1 AND deal_id = $2;
    '
    result = SqlRunner.run(sql, [@burger_id, @deal_id])
    length = result.to_a.length
    return true if length > 0
    return false
  end

end
