$TTL  2d
@     IN    SOA   ns.example.com. admin.example.com. (
                  2307161955     ; Serial Note: increment after each change
                  12h            ; Refresh
                  15m            ; Retry
                  3w             ; Expire
                  2h )           ; Negative Cache TTL
@     IN    NS    ns.example.com.
ns    IN    A     192.168.0.100
@     IN    A     192.168.0.100
*     IN    A     192.168.0.100
