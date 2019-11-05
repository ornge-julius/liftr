##
# A MySQL connection:
# DataMapper.setup(:default, 'mysql://user:password@localhost/the_database_name')
#
# # A Postgres connection:
# DataMapper.setup(:default, 'postgres://user:password@localhost/the_database_name')
#
# # A Sqlite3 connection
# DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "development.db"))
#
# # Setup DataMapper using config/database.yml
# DataMapper.setup(:default, YAML.load_file(Padrino.root('config/database.yml'))[RACK_ENV])
#
# config/database.yml file:
#
# ---
# development: &defaults
#   adapter: mysql
#   database: example_development
#   username: user
#   password: Pa55w0rd
#   host: 127.0.0.1
#
# test:
#   <<: *defaults
#   database: example_test
#
# production:
#   <<: *defaults
#   database: example_production
#

DataMapper.logger = logger
DataMapper::Property::String.length(255)

case Padrino.env
  when :development then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "liftr_development.db"))
  when :production  then DataMapper.setup(:default, "postgres://hlglgpprsxqnno:b5bb599b88aad4d4eeaf1b3eb86285cf6b5271399566c87a42633f2cdbfd37f2@ec2-174-129-253-140.compute-1.amazonaws.com:5432/da4gnieli46epm")
  when :test        then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "liftr_test.db"))
end
