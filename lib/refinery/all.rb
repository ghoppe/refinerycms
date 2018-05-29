%w(core images resources dragonfly pages).each do |extension|
  require "refinerycms-#{extension}"
end
