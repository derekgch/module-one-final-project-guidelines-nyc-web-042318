require 'bundler'
require_relative "../lib/fetch.rb"
require_relative "../lib/command_line_interface.rb"
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'app'
