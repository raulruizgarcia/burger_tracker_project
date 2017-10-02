require 'pg'

class SqlRunner
    def self.run(sql, values = [])
      begin
        db = PG.connect({dbname: 'd7fs1b0c4ammbr', host: 'ec2-184-72-223-199.compute-1.amazonaws.com',
        port: '5432', user: 'rcozoljcimezcc',
        password: 'd0c4c863499cd4541c8d9f273ca5933553f74aa6410a1942971ca44110cb11d4'})
        db.prepare("query", sql)
        result = db.exec_prepared("query", values)
      ensure
        db.close()
      end
      return result
    end
end
