class Resource < ApplicationRecord
  validates_presence_of :name

  belongs_to :resource_type
  belongs_to :user
  has_many :resource_parts
  has_many :parts, through: :resource_parts

  def self.all_active_resources
    where(active:true)
  end

  def self.all_with_tickets
    sql = "SELECT *, CASE WHEN table_key is not null THEN 1 END as open_ticket
              FROM resources LEFT OUTER JOIN tickets on resources.id = tickets.table_key;"
    results = ActiveRecord::Base.connection.execute(sql)
  end

  def self.high_volume_tickets
    sql = "SELECT resources.name, resources.id, count(table_key)as number_tickets
              FROM resources LEFT OUTER JOIN tickets on resources.id = tickets.table_key
              GROUP BY resources.name, resources.id having count(table_name) >= 2;"
    results = ActiveRecord::Base.connection.execute(sql)
  end

  def self.perc_urgent_tickets
    sql = "SELECT
            (sum(CASE WHEN table_key is not null THEN 1.0 ELSE 0 END)
            /count(*)) as perc_urgent_tickets
              FROM resources
              LEFT OUTER JOIN tickets on tickets.table_key = resources.id;"
    results = ActiveRecord::Base.connection.execute(sql)
  end

  def self.fulfilled_tickets
    sql = "SELECT (sum(CASE WHEN status = 2 THEN 1.0 ELSE 0 END)) as fulfilled,
            count(*) as total_tix,
            (sum(CASE WHEN status = 2 THEN 1.0 ELSE 0 END)
            /count(*)) as fulfilled_tickets
              FROM resources
              INNER JOIN tickets on tickets.table_key = resources.id;"
    results = ActiveRecord::Base.connection.execute(sql)
  end

  def self.fulfilled_tickets_monthly(month, year)
    sql = "SELECT (sum(CASE WHEN status = 2 THEN 1.0 ELSE 0 END)) as fulfilled,
            count(*) as total_tix,
            (sum(CASE WHEN status = 2 THEN 1.0 ELSE 0 END)
            /count(*)) as fulfilled_tickets
              FROM resources
              INNER JOIN tickets on tickets.table_key = resources.id
              WHERE EXTRACT (MONTH FROM tickets.updated_at) = #{month}
              and EXTRACT (year FROM tickets.updated_at) = #{year};"
    results = ActiveRecord::Base.connection.execute(sql)
  end

end
