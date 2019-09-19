user table

column      | data_type
-----       | ---------
id          | integer
name        | string
email       | string
password    | string

task table 

column      | data_type
------------| ---------
 uSer_id(fk)| integer
 name       | string
 content    | text
 start_date | date
 end_date   | date
 status     | string
 priority   | string 
 
Label table 

column      | data_type
------------|  ---------
user_id     | integer
task_id     | integer
content     | text





