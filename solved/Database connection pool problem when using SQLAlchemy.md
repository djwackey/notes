# [Database connection pool problem when using SQLAlchemy](https://www.programmersought.com/article/43394815669/)

currently using create_engine When creating an engine, if the connection pool setting is not specified by default, in general, SQLAlchemy will use oneQueuePoolBind to the newly created engine. And attach the appropriate connection pool parameters.

In the default method create_engine (as follows), an engine with a connection pool will be created.

```python
  engine = create_engine('postgresql://postgres@127.0.0.1/dbname')
```

In this case, even if you explicitly call session.close() after using the session, the connection cannot be closed. The connection will be managed and reused by the QueuePool connection pool.

This feature is not a problem under normal circumstances, but when the database server is restarted for some reason. The database connection that was initially maintained fails. Subsequent methods such as session.query() will throw exceptions and cause program errors.

If you want to disable the database connection pool provided by SQLAlchemy, you only need to specify the connection pool as NullPool when calling create_engine, and SQLAlchemy will disconnect the database connection immediately after executing session.close(). Of course, if the session object is destroyed but session.close() is not called, the database connection will not be disconnected until the program terminates.

The following code can prevent SQLAlchemy from using connection pooling:

```python
#!/usr/bin/env python
#-*- coding: utf-8 -*-
 
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.pool import NullPool
 
engine = create_engine('postgresql://postgres@127.0.0.1/dbname',
  poolclass=NullPool)
Session = sessionmaker(bind=engine)
session = Session()
usr_obj_list = session.query(UsrObj).all()
print usr_obj_list[0].id
session.close()
```
