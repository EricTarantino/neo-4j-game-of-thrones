# neo-4j-game-of-thrones
## Intro
Graphs are comprised of nodes and edges.<br>
Neo4j is the most popular graph database and it's open source.<br>
Cypher is a query language for Neo4j.<br>
Cypher is declarative, we say what we want, not how.<br>

## Cypher-Create
Create a node with a property:
```sh
-CREATE(n{name:'Joffrey'})
```
Create a labled node: 
```sh
-CREATE(n:Character)
```
Create a labled node with properties
```sh
-CREATE(n:Character{name:'Joffrey', house:'Lannister'})
```
Return data
```sh
-RETURN n
```
Create nodes with a relationship
```sh
-CREATE(jof:Character{name:'Joffrey', house:'Lannister'})-[b:Betrayal]-> (ned:Character{name:'Ned Stark'})
```
Return data
```sh
-RETURN jof,b,ned
```
## Matching nodes
- (n)<br>
- (n:NodeType)<br>
- (n{property:'value'})<br>
- (n:NodeType{property:'value'})<br>
## Matching edges
- (n_1)--(n_2)<br>
- (n_1)-->(n_2), (n_2)<--(n_1)<br>
- (n_1)-->(n_2)-->(n_3), (n_1)-->(n_2)<--(n_3)<br>
## Matching edges and nodes
- (n_1)-[ r]->(n_2)<br>
- (n_1)-[ :RType]-(n_2)<br>
- (n_1)-[ :R1|:R2]-(n_2)<br>
- (n_1)-[ :RType*2]->(n_2)<br>
- (n_1)-[ :RType*]->(n_2)<br>
- (n_1)-[ :RType*2..10]->(n_2)<br>
- (n_1)-[ :RType*2..]->(n_2)<br>
## Arithmetic operations
+,-,*,/,%,^
## comparing
=,<>,<,>,>=,<=,=~,IS,NULL,IS NOT NULL
## Logical operations
AND, OR, XOR, NOT
## String operations
STARTS WITH, ENDS WITH, CONTAINS,+(Concatenate)
## WHERE
- WHERE character.name IN ['Joffrey', 'Cersei']<br>
- WHERE character.age IN range(18,30)<br>
- WHERE exists(a.name)<br>
- WHERE not exists(a.name)<br>
## Collections Operations
- MATCH (c:Character) RETURN count(c)<br>
- MATCH (c) count (DISTINC>T c.name)<br>
- MATCH (user) RETURN collect (user.name)<br>
- MATCH (c) RETURN avg (c.age)<br>
## Functions on paths
- length (path)
- relationships (path)
- nodes (path)
- MATCH shortestPath ((a)-[*]-(b))
- MATCH allShortestPath ((a)-[*]-(b))
## WITH
Propagate a results further to another query
## Run a script
```sh
./neo4j-shell -c < MY_FILE.cypher
```