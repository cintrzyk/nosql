require 'rubygems'
require 'couchrest'
require 'json'

file_name = ARGV[0]
dbase =     ARGV[1]
port =      ARGV[2]

couch = CouchRest.new("http://127.0.0.1:"+port.to_s)
db = couch.database!(dbase)

begin
    file = File.open(file_name,"r")
rescue
    puts "File error: "+file_name
end
 
hash_file=[]

file.each_line do |line|
    line.slice!(1..49)
    hash_file.push(JSON.parse(line))
end

hash_file.to_a.each { |person| db.save_doc(person) }

puts "Import data to Couchdb on port:"+port+" from "+file_name+"[file] success!"
