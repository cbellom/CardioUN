dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
//	username = "cardio"
//    password = "123456cardio"
    username = "root"
    password = "sBhtMFSt9Y"
	
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
//			http://z.joorge.com/phpmyadmin2/
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//			dbCreate = "update"
//			//url = "jdbc:mysql://mysql-BuoCardio.jelastic.servint.net/CardioTPI?autoReconnect=true"
//			url = "jdbc:mysql://z.joorge.com/buocardio?autoReconnect=true"
			pooled = true
			properties {
			   maxActive = -1
			   minEvictableIdleTimeMillis=1800000
			   timeBetweenEvictionRunsMillis=1800000
			   numTestsPerEvictionRun=3
			   testOnBorrow=true
			   testWhileIdle=true
			   testOnReturn=true
			   validationQuery="SELECT 1"
			}
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
//            url = "jdbc:mysql://localhost/cardio?autoReconnect=true"
			url = "jdbc:mysql://mysql-cardioun.jelastic.servint.net/CardioTPI?autoReconnect=true"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
