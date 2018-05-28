require 'bundler'

require_relative "../lib/fetch.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/dbfunction.rb"
require_relative "../lib/email.rb"
require_relative "../lib/menu.rb"
require_relative "../lib/gmail_api.rb"
require 'terminal-table'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

  # ActiveRecord::Base.logger
# ActiveRecord::Base.logger = old_logger
ActiveRecord::Base.logger = nil
require_all 'lib'
require_all 'app'
