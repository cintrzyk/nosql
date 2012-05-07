Technologie NoSQL
=================

Repozytorium ze wszystkimi zadaniami na potrzeby laboratorium.

Zadanie 1
---------

**POLECENIE:** 
Znaleźć ciekawe dane, które można poddać agregacji:

+ [facebook_friends.json](https://github.com/cintrzyk/nosql/blob/master/facebook_friends.json)

Dane zostały pobrane za pomoca Graph API ze strony facebook.com. Następnie zostały obrobione przy pomocy narzędzia Google Refine. Usunięto zbędne dane, dodano nowe dane: fetch URL -> Google Refine -> Graph API.

**POLECENIE:** 
Napisać skrypt zapisujący dane w wybranej bazie dokumentowej.

Skrypt zapisuje dane w bazie MongoDB: 

+ [to_mongodb.sh](https://github.com/cintrzyk/nosql/blob/master/to_mongodb.sh)

**POLECENIE:** 
Napisać skrypt przenoszący dane pomiędzy dwoma bazami dokumentowymi.

Skrypt eksportuje dane: MongoDB -> CouchDB. 

+ [mongodb_to_couchdb.sh](https://github.com/cintrzyk/nosql/blob/master/mongodb_to_couchdb.sh) - korzysta ze skryptu [script.rb](https://github.com/cintrzyk/nosql/blob/master/script.rb)


Zadanie 2
---------

**POLECENIE:** 
Przygotować aplikację korzystającą z obliczeń MapReduce.

+ [friends_googlemap](https://github.com/cintrzyk/nosql/tree/master/friends_googlemap)




