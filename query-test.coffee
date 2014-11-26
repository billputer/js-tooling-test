
neo4j = require 'neo4j'

db = new neo4j.GraphDatabase process.env['NEO4J_URL'] or 'http://172.16.250.142:7474'

query = [
  'MATCH (x {name: "Bill"})-[r]->(y)',
  'RETURN x.name, type(r), y.name',
].join '\n'

db.query query, null, (err, results) ->
  if err
    console.error 'Error querying database:', err
  else
    console.log results


query = [
  'MATCH (x)-[impresses]->(y)',
  'RETURN x.name',
].join '\n'

db.query query, null, (err, results) ->
  if err
    console.error 'Error querying database:', err
  else
    console.log results
