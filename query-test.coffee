
neo4j = require 'neo4j'

db = new neo4j.GraphDatabase process.env['NEO4J_URL'] or 'http://172.16.250.142:7474'

query = [
  'MATCH (x)-[r]->(y)',
  'RETURN x.name, type(r), y.name',
].join '\n'

db.query query, null, (err, results) ->
  if err
    console.error 'Error querying database:', err
  else
    highfives =  (result['x.name'] + " " + result['type(r)'] + " " + result['y.name'] + "\n" for result in results)
    console.log highfives
