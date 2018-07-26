require 'csv'

CSV.foreach('db/address.csv') do |row|
  Address.create(name: row[0])
end

# Position.create(
#   [
#     { name: 'ポイントガード' },
#     { name: 'シューティングガード' },
#     { name: 'スモールフォワード' },
#     { name: 'パワーフォワード' },
#     { name: 'センター' }
#   ]
# )


