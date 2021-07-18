json.extract! dns_entry, :id, :type, :name, :content, :ttl, :created_at, :updated_at
json.url dns_entry_url(dns_entry, format: :json)
