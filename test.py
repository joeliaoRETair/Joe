def test_cassandra():
    import cql
    print '1'
    con = cql.connect(host="192.168.1.159", port=9160, keyspace="icem")
    print '2'
    cur = con.cursor()
    print '3'
    result = cur.execute("select * from icem.behavior")
    print '' + result


test_cassandra()