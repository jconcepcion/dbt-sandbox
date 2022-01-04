-- Whitelist of dbt IP addresses for Snowflake
/*dbt IP 52.45.144.63, 54.81.134.249, or 52.22.161.231.*/
/* Creating a network policy for employees */
CREATE OR REPLACE NETWORK POLICY cat_club
ALLOWED_IP_LIST = ( '52.45.144.63', '54.81.134.249', '52.22.161.231','192.168.1.1' ) -- change the localhost IP to my public IP
BLOCKED_IP_LIST = ( '1.1.1.128', '2.2.2.128' ) -- random
COMMENT = 'I need this for dbt cloud access';
/* We now have the new network policy */
SHOW NETWORK POLICIES;
/* And here's what the network policy does: */
DESCRIBE NETWORK POLICY cat_club;
/* Assigning it to a user */
ALTER user DBT_CLOUD SET NETWORK_POLICY=cat_club;
ALTER user DBT_CLOUD_DEV SET NETWORK_POLICY=cat_club;
ALTER user <superuser> SET NETWORK_POLICY=cat_club;
SHOW users;
