
neo4j = require 'neo4j'

# statically defined ip for now
db = new neo4j.GraphDatabase 'http://172.16.250.142:7474'

# TODO: use a flow control tool to get rid of callback pyramid
bill = db.createNode {name: 'Bill'}
bill.save (err, node) ->
  if err
    console.error 'Error saving new node to database:', err
  else
    console.log 'Node saved to database with id:', node.id
    dave = db.createNode {name: 'Dave'}
    dave.save (err, node) ->
      if err
        console.error 'Error saving new node to database:', err
      else
        console.log 'Node saved to database with id:', node.id
        bill.createRelationshipTo dave, 'impresses', {}, (err, relationship) ->
          if err
            console.error 'Error creating relationship:', err
          else
            console.log 'Relationship created:', relationship.id
