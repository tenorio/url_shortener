# This will populate our DB with 150 random URL's and also choose a random number of counter hits.

150.times do
  hits = [*1..100].sample
  www_prefix = rand(6) % 2 == 0 ? true : false
  www = www_prefix ? 'www.' : nil
  url = "#{www}#{Faker::Internet.domain_name}"

  Address.create!(url: url, counter_hit: hits)
end
