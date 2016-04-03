#!/usr/bin/env ruby
module Curls
    def Curls.new_state gameid, username, userlife, level, cur, max
        puts `curl -H "Content-Type: application/json" -X POST -d '{"gameid":#{gameid},"username":"#{username}","userlife":#{userlife},"level":#{level},"currentbosshealth":#{cur},"maxbosshealth":#{max}}' http://localhost:3000/state`
    end
    def Curls.res gameid, failed, commit
        puts `curl -H "Content-Type: application/json" -X POST -d '{"gameid":#{gameid},"failed":#{failed},"commit":"#{commit}"}' http://localhost:3000/request`
    end
    def Curls.get gameid
        puts `curl -H "Content-Type: application/json" -X GET -d '{"gameid":"#{username}"}' http://localhost:3000/state`
    end
    def Curls.get_id
        (`curl -X GET http://localhost:3000/new` ).to_i
    end
end

@tests = 3

if File.exists? ".id"
    id = File.read(".id").chomp
    test = `rspec matrix.rb`
    res = test.split("\n")[0].chomp
    num = res.scan(/F/).count
    Curls.res id, num, "test"
else
    f = File.open ".id", "w+"
    id = Curls.get_id
    puts id
    f.puts id
    Curls.new_state id, "gheard", 6, 1, 3, 3
end
