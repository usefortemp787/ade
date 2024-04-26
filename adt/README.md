
-- step 1 
docker login

-- step 2
docker run --name mydb -p 5432:5432 -e POSTGRES_PASSWORD=pass -d postgres

-- step 3
install DBeaver
and connect with port 5432
and run the script