;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	orderer.example.com. orderer.example.com. (
			      3		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	localhost.

orderer.example.com.	IN	A	192.168.30.155
