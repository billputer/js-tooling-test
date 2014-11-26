# Load the http module to create an http server.
http = require 'http'
neo4j = require 'neo4j'

# per-process connection to neo4j (should use a connection pool)
db = new neo4j.GraphDatabase process.env['NEO4J_URL'] or 'http://172.16.250.142:7474'

server = http.createServer (request, response) -> 
  response.writeHead 200, {"Content-Type": "text/plain"}

  # print list of relationships
  query = [
    'MATCH (x)-[r]->(y)',
    'RETURN x.name, type(r), y.name',
  ].join '\n'
  db.query query, null, (err, results) ->
    if err
      console.error 'Error querying database:', err
      response.end 'Error querying database.\n'
    else
      relationships = (result['x.name'] + " " + result['type(r)'] + " " + result['y.name'] + "\n" for result in results)
      response.write relationships.join '\n'
      response.end "\n"

# Listen on port 8000, IP defaults to 127.0.0.1
server.listen 8000

# Put a friendly message on the terminal
console.log "Server running at http://127.0.0.1:8000/"
