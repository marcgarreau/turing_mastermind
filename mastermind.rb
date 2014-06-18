Dir["./lib/*.rb"].each {|file| require "#{file}"}

GameREPL.new.start
