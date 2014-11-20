
neo4j = require 'neo4j'

# statically defined ip for now
db = new neo4j.GraphDatabase 'http://172.16.250.142:7474'

error_handler = (err, node) ->
  if err
    console.error 'Error saving new node to database:', err
  else
    console.log 'Node saved to database with id:', node.id

bill = db.createNode {name: 'Bill'}
bill.save error_handler

dave = db.createNode {name: 'Dave'}
dave.save error_handler

# this fails because save is async
bill.createRelationshipTo dave, 'impresses', {}, error_handler
