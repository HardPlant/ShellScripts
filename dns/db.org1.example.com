;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	org1.example.com. org1.example.com. (
			      3		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	localhost.

peer0.org1.example.com.	IN	A	192.168.30.151
