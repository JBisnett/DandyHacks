#!/usr/bin/env ruby
type = ARGV.shift
case type
when "state"
    gameid = ARGV.shift
    username = ARGV.shift
    userlife = ARGV.shift
    level = ARGV.shift
    cur = ARGV.shift
    max = ARGV.shift
    puts `curl -H "Content-Type: application/json" -X POST -d '{"gameid":#{gameid},"username":"#{username}","userlife":#{userlife},"level":#{level},"currentCompletion":#{cur},"maxCompletion":#{max}}' http://localhost:3000/state`
when "res"
    gameid = ARGV.shift
    failed = ARGV.shift
    commit = ARGV.shift
    puts `curl -H "Content-Type: application/json" -X POST -d '{"gameid":#{gameid},"failed":#{failed},"commit":"#{commit}"}' http://localhost:3000/result`
when "get"
    gameid = ARGV.shift
    puts `curl -H "Content-Type: application/json" -X GET -d '{"gameid":#{gameid}}' http://localhost:3000/state`
when "new"
    puts `curl -X GET http://localhost:3000/new`
end

