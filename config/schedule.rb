# clear prerender cache
every 3.days do
  command 'mongo prerender --eval "db.pages.drop()"'
end
