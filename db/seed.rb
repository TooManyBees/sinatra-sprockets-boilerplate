items = [
  # array of hashes
]

inserted = 0
updated = 0

if $db.table_exists?(:items)
  items = $db[:items]
  cs.each_with_index do |c, i|
    idx = i+1  # DB indexes start a 1, genius
    existing = items[id: idx]
    if !existing
      items.insert(c)
      inserted += 1
    elsif existing.to_hash != {id: idx}.merge(c)
      items.where(id: idx).update(c)
      updated += 1
    end
  end
end

puts "Inserted #{inserted} rows"
puts "Updated #{updated} rows"
