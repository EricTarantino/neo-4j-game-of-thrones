CREATE (n {house: 'Lannister'})

CREATE (p1: Person{name: 'Daenerys Targaryen'})-[r:AUNT]->(p2:Person{name:'Jon Snow'})RETURN p1,p2,r

MATCH(p1:Person{name: 'Jon Snow'}), (p2:Person{name:'Daenerys Targaryen'}) create (p1)-[r:NEICE]->(p2) RETURN p1,p2,r
MATCH(p1:Person{name: 'Jon Snow'}), (p2:Person{name:'Daenerys Targaryen'}) create (p1)-[r:IS_IN_LOVE_WITH{how:'head over tail'}]-> (p2) RETURN p1,p2,r
MATCH (a:Person), (b:Person) WHERE a.name="Jon Snow" AND b.name='Daenerys Targaryen' WITH a,b create (a)-[r:BENDS_KNEE_TO]->(b) RETURN a,b,r
MATCH (p:Person{name:'Jon Snow'}) SET p.name = 'John Snow' RETURN p
MATCH (p:Person{name:'John Snow'}) SET p.name = 'Jon Snow' SET p.title = 'King of the North' RETURN p
MATCH (p1:Person{name: 'Jon Snow'})-[r]->(p2:Person{name:'Daenerys Targaryen'}) RETURN p1, p2, r
MATCH (p1:Person{name: 'Jon Snow'})-[r:IS_IN_LOVE_WITH]->(p2:Person{name:'Daenerys Targaryen'}) RETURN p1, p2, r
MATCH (p1:Person{name: 'Jon Snow'})-[r:IS_IN_LOVE_WITH|BENDS_KNEE_TO]->(p2:Person{name:'Daenerys Targaryen'}) RETURN p1, p2, r
MATCH ()-[r:BENDS_KNEE_TO]->(p2) return p2
MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r
MATCH (n) OPTIONAL MATCH (n)-[r]-() RETURN n, r
MATCH (p:Person) where ID(p)=1 OPTIONAL MATCH (p)-[r]-() DELETE r,p

// change label name
MATCH (n:site{name:"nuxt-vuetify"}) REMOVE n:site SET n:npm