##====================================================================
## EMQ X Configuration R4.0 tu
##====================================================================

##--------------------------------------------------------------------
## Cluster
##--------------------------------------------------------------------

## Cluster name.
##
## Value: String
cluster.name = emqxcl

## Specify the erlang distributed protocol.
##
## Value: Enum
##  - inet_tcp: the default; handles TCP streams with IPv4 addressing.
##  - inet6_tcp: handles TCP with IPv6 addressing.
##  - inet_tls: using TLS for Erlang Distribution.
##
## vm.args: -proto_dist inet_tcp
cluster.proto_dist = inet_tcp

## Cluster auto-discovery strategy.
##
## Value: Enum
## - manual: Manual join command
## - static: Static node list
## - mcast:  IP Multicast
## - dns:    DNS A Record
## - etcd:   etcd
## - k8s:    Kubernates
##
## Default: manual
cluster.discovery = k8s

## Enable cluster autoheal from network partition.
##
## Value: on | off
##
## Default: on
cluster.autoheal = on

## Autoclean down node. A down node will be removed from the cluster
## if this value > 0.
##
## Value: Duration
## -h: hour, e.g. '2h' for 2 hours
## -m: minute, e.g. '5m' for 5 minutes
## -s: second, e.g. '30s' for 30 seconds
##
## Default: 5m
cluster.autoclean = 5m

##--------------------------------------------------------------------
## Cluster using static node list

## Node list of the cluster.
##
## Value: String
## cluster.static.seeds = emqx1@127.0.0.1,emqx2@127.0.0.1

##--------------------------------------------------------------------
## Cluster using IP Multicast.

## IP Multicast Address.
##
## Value: IP Address
## cluster.mcast.addr = 239.192.0.1

## Multicast Ports.
##
## Value: Port List
## cluster.mcast.ports = 4369,4370

## Multicast Iface.
##
## Value: Iface Address
##
## Default: 0.0.0.0
## cluster.mcast.iface = 0.0.0.0

## Multicast Ttl.
##
## Value: 0-255
## cluster.mcast.ttl = 255

## Multicast loop.
##
## Value: on | off
## cluster.mcast.loop = on

##--------------------------------------------------------------------
## Cluster using DNS A records.

## DNS name.
##
## Value: String
## cluster.dns.name = localhost

## The App name is used to build 'node.name' with IP address.
##
## Value: String
## cluster.dns.app = emqx

##--------------------------------------------------------------------
## Cluster using etcd

## Etcd server list, seperated by ','.
##
## Value: String
## cluster.etcd.server = http://127.0.0.1:2379

## The prefix helps build nodes path in etcd. Each node in the cluster
## will create a path in etcd: v2/keys/<prefix>/<cluster.name>/<node.name>
##
## Value: String
## cluster.etcd.prefix = emqxcl

## The TTL for node's path in etcd.
##
## Value: Duration
##
## Default: 1m, 1 minute
## cluster.etcd.node_ttl = 1m

## Path to a file containing the client's private PEM-encoded key.
##
## Value: File
## cluster.etcd.ssl.keyfile = etc/certs/client-key.pem

## The path to a file containing the client's certificate.
##
## Value: File
## cluster.etcd.ssl.certfile = etc/certs/client.pem

## Path to the file containing PEM-encoded CA certificates. The CA certificates
## are used during server authentication and when building the client certificate chain.
##
## Value: File
## cluster.etcd.ssl.cacertfile = etc/certs/ca.pem

##--------------------------------------------------------------------
## Cluster using Kubernates

## Kubernates API server list, seperated by ','.
##
## Value: String
cluster.k8s.apiserver = https://172.30.0.1:443

## The service name helps lookup EMQ nodes in the cluster.
##
## Value: String
cluster.k8s.service_name = emqx-openshift

## The address type is used to extract host from k8s service.
##
## Value: ip | dns | hostname
cluster.k8s.address_type = ip

## The app name helps build 'node.name'.
##
## Value: String
cluster.k8s.app_name = emqx

## The suffix added to dns and hostname get from k8s service
##
## Value: String
cluster.k8s.suffix = pod.cluster.local

## Kubernates Namespace
##
## Value: String
cluster.k8s.namespace = emqx-openshift

##--------------------------------------------------------------------
## Node
##--------------------------------------------------------------------

## Node name.
##
## See: http://erlang.org/doc/reference_manual/distributed.html
##
## Value: <name>@<host>
##
## Default: emqx@127.0.0.1
node.name = emqx@127.0.0.1

## Cookie for distributed node communication.
##
## Value: String
node.cookie = emqxsecretcookie

## Data dir for the node
##
## Value: Folder
node.data_dir = data

## Heartbeat monitoring of an Erlang runtime system. Comment the line to disable
## heartbeat, or set the value as 'on'
##
## Value: on
##
## vm.args: -heart
## node.heartbeat = on

## Sets the number of threads in async thread pool. Valid range is 0-1024.
##
## See: http://erlang.org/doc/man/erl.html
##
## Value: 0-1024
##
## vm.args: +A Number
node.async_threads = 32

## Sets the maximum number of simultaneously existing processes for this
## system if a Number is passed as value.
##
## See: http://erlang.org/doc/man/erl.html
##
## Value: Number [1024-134217727]
##
## vm.args: +P Number
node.process_limit = 2048000

## Sets the maximum number of simultaneously existing ports for this system.
##
## See: http://erlang.org/doc/man/erl.html
##
## Value: Number [1024-134217727]
##
## vm.args: +Q Number
node.max_ports = 1024000

## Set the distribution buffer busy limit (dist_buf_busy_limit).
##
## See: http://erlang.org/doc/man/erl.html
##
## Value: Number [1KB-2GB]
##
## vm.args: +zdbbl size
node.dist_buffer_size = 8MB

## Sets the maximum number of ETS tables. Note that mnesia and SSL will
## create temporary ETS tables.
##
## Value: Number
##
## vm.args: +e Number
node.max_ets_tables = 256000

## Tweak GC to run more often.
##
## Value: Number [0-65535]
##
## vm.args: -env ERL_FULLSWEEP_AFTER Number
node.fullsweep_after = 1000

## Crash dump log file.
##
## Value: Log file
node.crash_dump = log/crash.dump

## Specify SSL Options in the file if using SSL for Erlang Distribution.
##
## Value: File
##
## vm.args: -ssl_dist_optfile <File>
## node.ssl_dist_optfile = etc/ssl_dist.conf

## Sets the net_kernel tick time. TickTime is specified in seconds.
## Notice that all communicating nodes are to have the same TickTime
## value specified.
##
## See: http://www.erlang.org/doc/man/kernel_app.html#net_ticktime
##
## Value: Number
##
## vm.args: -kernel net_ticktime Number
node.dist_net_ticktime = 60

## Sets the port range for the listener socket of a distributed Erlang node.
## Note that if there are firewalls between clustered nodes, this port segment
## for nodes’ communication should be allowed.
##
## See: http://www.erlang.org/doc/man/kernel_app.html
##
## Value: Port [1024-65535]
node.dist_listen_min = 6369
node.dist_listen_max = 6369

##--------------------------------------------------------------------
## RPC
##--------------------------------------------------------------------
## RPC Mode.
##
## Value: sync | async
rpc.mode = async

## Max batch size of async RPC requests.
##
## Value: Integer
## Zero or negative value disables rpc batching.
##
## NOTE: RPC batch won't work when rpc.mode = sync
rpc.async_batch_size = 256

## TCP server port for RPC.
##
## Value: Port [1024-65535]
rpc.tcp_server_port = 5369

## TCP port for outgoing RPC connections.
##
## Value: Port [1024-65535]
rpc.tcp_client_port = 5369

## Number of utgoing RPC connections.
##
## Value: Interger [1-256]
rpc.tcp_client_num = 32

## RCP Client connect timeout.
##
## Value: Seconds
rpc.connect_timeout = 5s

## TCP send timeout of RPC client and server.
##
## Value: Seconds
rpc.send_timeout = 5s

## Authentication timeout
##
## Value: Seconds
rpc.authentication_timeout = 5s

## Default receive timeout for call() functions
##
## Value: Seconds
rpc.call_receive_timeout = 15s

## Socket idle keepalive.
##
## Value: Seconds
rpc.socket_keepalive_idle = 900s

## TCP Keepalive probes interval.
##
## Value: Seconds
rpc.socket_keepalive_interval = 75s

## Probes lost to close the connection
##
## Value: Integer
rpc.socket_keepalive_count = 9

## Size of TCP send buffer.
##
## Value: Bytes
rpc.socket_sndbuf = 1MB

## Size of TCP receive buffer.
##
## Value: Seconds
rpc.socket_recbuf = 1MB

## Size of user-level software socket buffer.
##
## Value: Seconds
rpc.socket_buffer = 1MB

##--------------------------------------------------------------------
## Log
##--------------------------------------------------------------------

## Where to emit the logs.
## Enable the console (standard output) logs.
##
## Value: off | file | console | both
## - off: disable logs entirely
## - file: write logs only to file
## - console: write logs only to standard I/O
## - both: write logs both to file and standard I/O
log.to = both

## The log severity level.
##
## Value: debug | info | notice | warning | error | critical | alert | emergency
##
## Note: Only the messages with severity level higher than or equal to
##       this level will be logged.
##
## Default: warning
log.level = debug

## The dir for log files.
##
## Value: Folder
log.dir = log

## The log filename for logs of level specified in "log.level".
##
## Value: String
## Default: emqx.log
log.file = emqx.log

## Limits the total number of characters printed for each log event.
##
## Value: Integer
## Default: No Limit
#log.chars_limit = 8192

## Maximum size of each log file.
##
## Value: Number
## Default: 10M
## Supported Unit: KB | MB | GB
log.rotation.size = 10MB

## Maximum rotation count of log files.
##
## Value: Number
## Default: 5
log.rotation.count = 5

## To create additional log files for specific log levels.
##
## Value: File Name
## Format: log.$level.file = $filename,
##         where "$level" can be one of: debug, info, notice, warning,
##                                       error, critical, alert, emergency
## Note: Log files for a specific log level will only contain all the logs
##       that higher than or equal to that level
##
#log.info.file = info.log
#log.error.file = error.log

##--------------------------------------------------------------------
## Authentication/Access Control
##--------------------------------------------------------------------

## Allow anonymous authentication by default if no auth plugins loaded.
## Notice: Disable the option in production deployment!
##
## Value: true | false
allow_anonymous = true

## Allow or deny if no ACL rules matched.
##
## Value: allow | deny
acl_nomatch = deny

## Default ACL File.
##
## Value: File Name
acl_file = etc/acl.conf

## Whether to enable ACL cache.
##
## If enabled, ACLs roles for each client will be cached in the memory
##
## Value: on | off
enable_acl_cache = on

## The maximum count of ACL entries can be cached for a client.
##
## Value: Integer greater than 0
## Default: 32
acl_cache_max_size = 32

## The time after which an ACL cache entry will be deleted
##
## Value: Duration
## Default: 1 minute
acl_cache_ttl = 1m

## The action when acl check reject current operation
##
## Value: ignore | disconnect
## Default: ignore
acl_deny_action = disconnect

## Specify the global flapping detect policy.
## The value is a string composed of flapping threshold, duration and banned interval.
## 1. threshold: an integer to specfify the disconnected times of a MQTT Client;
## 2. duration: the time window for flapping detect;
## 3. banned interval: the banned interval if a flapping is detected.
##
## Value: Integer,Duration,Duration
flapping_detect_policy = 30, 1m, 5m

##--------------------------------------------------------------------
## MQTT Protocol
##--------------------------------------------------------------------

## Maximum MQTT packet size allowed.
##
## Value: Bytes
## Default: 1MB
mqtt.max_packet_size = 1MB

## Maximum length of MQTT clientId allowed.
##
## Value: Number [23-65535]
mqtt.max_clientid_len = 65535

## Maximum topic levels allowed. 0 means no limit.
##
## Value: Number
mqtt.max_topic_levels = 0

## Maximum QoS allowed.
##
## Value: 0 | 1 | 2
mqtt.max_qos_allowed = 2

## Maximum Topic Alias, 0 means no topic alias supported.
##
## Value: 0-65535
mqtt.max_topic_alias = 65535

## Whether the Server supports MQTT retained messages.
##
## Value: boolean
mqtt.retain_available = true

## Whether the Server supports MQTT Wildcard Subscriptions
##
## Value: boolean
mqtt.wildcard_subscription = true

## Whether the Server supports MQTT Shared Subscriptions.
##
## Value: boolean
mqtt.shared_subscription = true

## Whether to ignore loop delivery of messages.(for mqtt v3.1.1)
##
## Value: true | false
mqtt.ignore_loop_deliver = false

## Whether to parse the MQTT frame in strict mode
##
## Value: true | false
mqtt.strict_mode = false

##--------------------------------------------------------------------
## Zones
##--------------------------------------------------------------------

##--------------------------------------------------------------------
## External Zone

## Idle timeout of the external MQTT connections.
##
## Value: duration
zone.external.idle_timeout = 15s

## Hibernate after a duration of idle state.
##
## Value: duration
zone.external.hibernate_after = 60s

## Publish limit for the external MQTT connections.
##
## Value: Number,Duration
## Example: 100 messages per 10 seconds.
## zone.external.publish_limit = 100,10s

## Enable ACL check.
##
## Value: Flag
zone.external.enable_acl = on

## Enable ban check.
##
## Value: Flag
zone.external.enable_ban = on

## Enable per connection statistics.
##
## Value: on | off
zone.external.enable_stats = on

## The action when acl check reject current operation
##
## Value: ignore | disconnect
## Default: ignore
zone.external.acl_deny_action = ignore

## Force MQTT connection/session process GC after this number of
## messages | bytes passed through.
##
## Numbers delimited by `|'. Zero or negative is to disable.
zone.external.force_gc_policy = 1000|1MB

## Max message queue length and total heap size to force shutdown
## connection/session process.
## Message queue here is the Erlang process mailbox, but not the number
## of queued MQTT messages of QoS 1 and 2.
##
## Numbers delimited by `|'. Zero or negative is to disable.
##
## Default:
##   - 10000|32MB on ARCH_64 system
##   - 10000|16MB on ARCH_32 sytem
## zone.external.force_shutdown_policy = 10000|32MB

## Maximum MQTT packet size allowed.
##
## Value: Bytes
## Default: 1MB
## zone.external.max_packet_size = 64KB

## Maximum length of MQTT clientId allowed.
##
## Value: Number [23-65535]
## zone.external.max_clientid_len = 1024

## Maximum topic levels allowed. 0 means no limit.
##
## Value: Number
## zone.external.max_topic_levels = 7

## Maximum QoS allowed.
##
## Value: 0 | 1 | 2
## zone.external.max_qos_allowed = 2

## Maximum Topic Alias, 0 means no limit.
##
## Value: 0-65535
## zone.external.max_topic_alias = 65535

## Whether the Server supports retained messages.
##
## Value: boolean
## zone.external.retain_available = true

## Whether the Server supports Wildcard Subscriptions
##
## Value: boolean
## zone.external.wildcard_subscription = false

## Whether the Server supports Shared Subscriptions
##
## Value: boolean
## zone.external.shared_subscription = false

## Server Keep Alive
##
## Value: Number
## zone.external.server_keepalive = 0

## The backoff for MQTT keepalive timeout. The broker will kick a connection out
## until 'Keepalive * backoff * 2' timeout.
##
## Value: Float > 0.5
zone.external.keepalive_backoff = 0.75

## Maximum number of subscriptions allowed, 0 means no limit.
##
## Value: Number
zone.external.max_subscriptions = 0

## Force to upgrade QoS according to subscription.
##
## Value: on | off
zone.external.upgrade_qos = off

## Maximum size of the Inflight Window storing QoS1/2 messages delivered but unacked.
##
## Value: Number
zone.external.max_inflight = 32

## Retry interval for QoS1/2 message delivering.
##
## Value: Duration
zone.external.retry_interval = 30s

## Maximum QoS2 packets (Client -> Broker) awaiting PUBREL, 0 means no limit.
##
## Value: Number
zone.external.max_awaiting_rel = 100

## The QoS2 messages (Client -> Broker) will be dropped if awaiting PUBREL timeout.
##
## Value: Duration
zone.external.await_rel_timeout = 300s

## Default session expiry interval for MQTT V3.1.1 connections.
##
## Value: Duration
## -d: day
## -h: hour
## -m: minute
## -s: second
##
## Default: 2h, 2 hours
zone.external.session_expiry_interval = 2h

## Maximum queue length. Enqueued messages when persistent client disconnected,
## or inflight window is full. 0 means no limit.
##
## Value: Number >= 0
zone.external.max_mqueue_len = 1000

## Topic priorities.
## 'none' to indicate no priority table (by default), hence all messages
## are treated equal
##
## Priority number [1-255]
## Example: topic/1=10,topic/2=8
## NOTE: comma and equal signs are not allowed for priority topic names
## NOTE: messages for topics not in the priority table are treated as
##       either highest or lowest priority depending on the configured
##       value for mqueue_default_priority
##
zone.external.mqueue_priorities = none

## Default to highest priority for topics not matching priority table
##
## Value: highest | lowest
zone.external.mqueue_default_priority = highest

## Whether to enqueue QoS0 messages.
##
## Value: false | true
zone.external.mqueue_store_qos0 = true

## Whether to turn on flapping detect
##
## Value: on | off
zone.external.enable_flapping_detect = off

## All the topics will be prefixed with the mountpoint path if this option is enabled.
##
## Variables in mountpoint path:
##  - %c: clientid
##  - %u: username
##
## Value: String
## zone.external.mountpoint = devicebound/

## Whether use username replace client id
##
## Value: boolean
## Default: false
zone.external.use_username_as_clientid = false

## Whether to ignore loop delivery of messages.(for mqtt v3.1.1)
##
## Value: true | false
zone.external.ignore_loop_deliver = false

## Whether to parse the MQTT frame in strict mode
##
## Value: true | false
zone.external.strict_mode = false

##--------------------------------------------------------------------
## Internal Zone

zone.internal.allow_anonymous = true

## Enable per connection stats.
##
## Value: Flag
zone.internal.enable_stats = on

## Enable ACL check.
##
## Value: Flag
zone.internal.enable_acl = off

## The action when acl check reject current operation
##
## Value: ignore | disconnect
## Default: ignore
zone.internal.acl_deny_action = ignore

## See zone.$name.wildcard_subscription.
##
## Value: boolean
## zone.internal.wildcard_subscription = true

## See zone.$name.shared_subscription.
##
## Value: boolean
## zone.internal.shared_subscription = true

## See zone.$name.max_subscriptions.
##
## Value: Integer
zone.internal.max_subscriptions = 0

## See zone.$name.max_inflight
##
## Value: Number
zone.internal.max_inflight = 128

## See zone.$name.max_awaiting_rel
##
## Value: Number
zone.internal.max_awaiting_rel = 1000

## See zone.$name.max_mqueue_len
##
## Value: Number >= 0
zone.internal.max_mqueue_len = 10000

## Whether to enqueue Qos0 messages.
##
## Value: false | true
zone.internal.mqueue_store_qos0 = true

## Whether to turn on flapping detect
##
## Value: on | off
zone.internal.enable_flapping_detect = off

## See zone.$name.force_shutdown_policy
##
## Default:
##   - 10000|32MB on ARCH_64 system
##   - 10000|16MB on ARCH_32 sytem
zone.internal.force_shutdown_policy = 100000|64MB

## All the topics will be prefixed with the mountpoint path if this option is enabled.
##
## Variables in mountpoint path:
##  - %c: clientid
##  - %u: username
##
## Value: String
## zone.internal.mountpoint = cloudbound/

## Whether to ignore loop delivery of messages.(for mqtt v3.1.1)
##
## Value: true | false
zone.internal.ignore_loop_deliver = false

## Whether to parse the MQTT frame in strict mode
##
## Value: true | false
zone.internal.strict_mode = false

##--------------------------------------------------------------------
## Listeners
##--------------------------------------------------------------------

##--------------------------------------------------------------------
## MQTT/TCP - External TCP Listener for MQTT Protocol

## listener.tcp.$name is the IP address and port that the MQTT/TCP
## listener will bind.
##
## Value: IP:Port | Port
##
## Examples: 1883, 127.0.0.1:1883, ::1:1883
listener.tcp.external = 0.0.0.0:1883

## The acceptor pool for external MQTT/TCP listener.
##
## Value: Number
listener.tcp.external.acceptors = 8

## Maximum number of concurrent MQTT/TCP connections.
##
## Value: Number
listener.tcp.external.max_connections = 1024000

## Maximum external connections per second.
##
## Value: Number
listener.tcp.external.max_conn_rate = 1000

## Specify the {active, N} option for the external MQTT/TCP Socket.
##
## Value: Number
listener.tcp.external.active_n = 100

## Zone of the external MQTT/TCP listener belonged to.
##
## See: zone.$name.*
##
## Value: String
listener.tcp.external.zone = external

## Rate limit for the external MQTT/TCP connections. Format is 'limit,duration'.
##
## Value: limit,duration
## Default: 100KB incoming per 10 seconds.
## listener.tcp.external.rate_limit = 100KB,10s

## The access control rules for the MQTT/TCP listener.
##
## See: https://github.com/emqtt/esockd#allowdeny
##
## Value: ACL Rule
##
## Example: allow 192.168.0.0/24
listener.tcp.external.access.1 = allow all

## Enable the Proxy Protocol V1/2 if the EMQ X cluster is deployed
## behind HAProxy or Nginx.
##
## See: https://www.haproxy.com/blog/haproxy/proxy-protocol/
##
## Value: on | off
## listener.tcp.external.proxy_protocol = on

## Sets the timeout for proxy protocol. EMQ X will close the TCP connection
## if no proxy protocol packet recevied within the timeout.
##
## Value: Duration
## listener.tcp.external.proxy_protocol_timeout = 3s

## Enable the option for X.509 certificate based authentication.
## EMQX will use the common name of certificate as MQTT username.
##
## Value: cn | dn | crt
## listener.tcp.external.peer_cert_as_username = cn

## The TCP backlog defines the maximum length that the queue of pending
## connections can grow to.
##
## Value: Number >= 0
listener.tcp.external.backlog = 1024

## The TCP send timeout for external MQTT connections.
##
## Value: Duration
listener.tcp.external.send_timeout = 15s

## Close the TCP connection if send timeout.
##
## Value: on | off
listener.tcp.external.send_timeout_close = on

## The TCP receive buffer(os kernel) for MQTT connections.
##
## See: http://erlang.org/doc/man/inet.html
##
## Value: Bytes
## listener.tcp.external.recbuf = 2KB

## The TCP send buffer(os kernel) for MQTT connections.
##
## See: http://erlang.org/doc/man/inet.html
##
## Value: Bytes
## listener.tcp.external.sndbuf = 2KB

## The size of the user-level software buffer used by the driver.
## Not to be confused with options sndbuf and recbuf, which correspond
## to the Kernel socket buffers. It is recommended to have val(buffer)
## >= max(val(sndbuf),val(recbuf)) to avoid performance issues because
## of unnecessary copying. val(buffer) is automatically set to the above
## maximum when values sndbuf or recbuf are set.
##
## See: http://erlang.org/doc/man/inet.html
##
## Value: Bytes
## listener.tcp.external.buffer = 2KB

## Sets the 'buffer = max(sndbuf, recbuf)' if this option is enabled.
##
## Value: on | off
## listener.tcp.external.tune_buffer = off

## The TCP_NODELAY flag for MQTT connections. Small amounts of data are
## sent immediately if the option is enabled.
##
## Value: true | false
listener.tcp.external.nodelay = true

## The SO_REUSEADDR flag for TCP listener.
##
## Value: true | false
listener.tcp.external.reuseaddr = true

##--------------------------------------------------------------------
## Internal TCP Listener for MQTT Protocol

## The IP address and port that the internal MQTT/TCP protocol listener
## will bind.
##
## Value: IP:Port, Port
##
## Examples: 11883, 127.0.0.1:11883, ::1:11883
listener.tcp.internal = 127.0.0.1:11883

## The acceptor pool for internal MQTT/TCP listener.
##
## Value: Number
listener.tcp.internal.acceptors = 4

## Maximum number of concurrent MQTT/TCP connections.
##
## Value: Number
listener.tcp.internal.max_connections = 1024000

## Maximum internal connections per second.
##
## Value: Number
listener.tcp.internal.max_conn_rate = 1000

## Specify the {active, N} option for the internal MQTT/TCP Socket.
##
## Value: Number
listener.tcp.internal.active_n = 1000

## Zone of the internal MQTT/TCP listener belonged to.
##
## Value: String
listener.tcp.internal.zone = internal

## Rate limit for the internal MQTT/TCP connections.
##
## See: listener.tcp.$name.rate_limit
##
## Value: limit,duration
## Default: 1MB incoming per second.
## listener.tcp.internal.rate_limit = 1MB,1s

## The TCP backlog of internal MQTT/TCP Listener.
##
## See: listener.tcp.$name.backlog
##
## Value: Number >= 0
listener.tcp.internal.backlog = 512

## The TCP send timeout for internal MQTT connections.
##
## See: listener.tcp.$name.send_timeout
##
## Value: Duration
listener.tcp.internal.send_timeout = 5s

## Close the MQTT/TCP connection if send timeout.
##
## See: listener.tcp.$name.send_timeout_close
##
## Value: on | off
listener.tcp.internal.send_timeout_close = on

## The TCP receive buffer(os kernel) for internal MQTT connections.
##
## See: listener.tcp.$name.recbuf
##
## Value: Bytes
listener.tcp.internal.recbuf = 64KB

## The TCP send buffer(os kernel) for internal MQTT connections.
##
## See: http://erlang.org/doc/man/inet.html
##
## Value: Bytes
listener.tcp.internal.sndbuf = 64KB

## The size of the user-level software buffer used by the driver.
##
## See: listener.tcp.$name.buffer
##
## Value: Bytes
## listener.tcp.internal.buffer = 16KB

## Sets the 'buffer = max(sndbuf, recbuf)' if this option is enabled.
##
## See: listener.tcp.$name.tune_buffer
##
## Value: on | off
## listener.tcp.internal.tune_buffer = off

## The TCP_NODELAY flag for internal MQTT connections.
##
## See: listener.tcp.$name.nodelay
##
## Value: true | false
listener.tcp.internal.nodelay = false

## The SO_REUSEADDR flag for MQTT/TCP Listener.
##
## Value: true | false
listener.tcp.internal.reuseaddr = true

##--------------------------------------------------------------------
## MQTT/SSL - External SSL Listener for MQTT Protocol

## listener.ssl.$name is the IP address and port that the MQTT/SSL
## listener will bind.
##
## Value: IP:Port | Port
##
## Examples: 8883, 127.0.0.1:8883, ::1:8883
listener.ssl.external = 8883

## The acceptor pool for external MQTT/SSL listener.
##
## Value: Number
listener.ssl.external.acceptors = 16

## Maximum number of concurrent MQTT/SSL connections.
##
## Value: Number
listener.ssl.external.max_connections = 102400

## Maximum MQTT/SSL connections per second.
##
## Value: Number
listener.ssl.external.max_conn_rate = 500

## Specify the {active, N} option for the internal MQTT/SSL Socket.
##
## Value: Number
listener.ssl.external.active_n = 100

## Zone of the external MQTT/SSL listener belonged to.
##
## Value: String
listener.ssl.external.zone = external

## The access control rules for the MQTT/SSL listener.
##
## See: listener.tcp.$name.access
##
## Value: ACL Rule
listener.ssl.external.access.1 = allow all

## Rate limit for the external MQTT/SSL connections.
##
## Value: limit,duration
## Default: 100KB incoming per 10 seconds.
## listener.ssl.external.rate_limit = 100KB,10s

## Enable the Proxy Protocol V1/2 if the EMQ cluster is deployed behind
## HAProxy or Nginx.
##
## See: listener.tcp.$name.proxy_protocol
##
## Value: on | off
## listener.ssl.external.proxy_protocol = on

## Sets the timeout for proxy protocol.
##
## See: listener.tcp.$name.proxy_protocol_timeout
##
## Value: Duration
## listener.ssl.external.proxy_protocol_timeout = 3s

## TLS versions only to protect from POODLE attack.
##
## See: http://erlang.org/doc/man/ssl.html
##
## Value: String, seperated by ','
## listener.ssl.external.tls_versions = tlsv1.2,tlsv1.1,tlsv1

## TLS Handshake timeout.
##
## Value: Duration
listener.ssl.external.handshake_timeout = 15s

## Path to the file containing the user's private PEM-encoded key.
##
## See: http://erlang.org/doc/man/ssl.html
##
## Value: File
listener.ssl.external.keyfile = etc/certs/key.pem

## Path to a file containing the user certificate.
##
## See: http://erlang.org/doc/man/ssl.html
##
## Value: File
listener.ssl.external.certfile = etc/certs/cert.pem

## Path to the file containing PEM-encoded CA certificates. The CA certificates
## are used during server authentication and when building the client certificate chain.
##
## Value: File
## listener.ssl.external.cacertfile = etc/certs/cacert.pem

## The Ephemeral Diffie-Helman key exchange is a very effective way of
## ensuring Forward Secrecy by exchanging a set of keys that never hit
## the wire. Since the DH key is effectively signed by the private key,
## it needs to be at least as strong as the private key. In addition,
## the default DH groups that most of the OpenSSL installations have
## are only a handful (since they are distributed with the OpenSSL
## package that has been built for the operating system it’s running on)
## and hence predictable (not to mention, 1024 bits only).
## In order to escape this situation, first we need to generate a fresh,
## strong DH group, store it in a file and then use the option above,
## to force our SSL application to use the new DH group. Fortunately,
## OpenSSL provides us with a tool to do that. Simply run:
## openssl dhparam -out dh-params.pem 2048
##
## Value: File
## listener.ssl.external.dhfile = etc/certs/dh-params.pem

## A server only does x509-path validation in mode verify_peer,
## as it then sends a certificate request to the client (this
## message is not sent if the verify option is verify_none).
## You can then also want to specify option fail_if_no_peer_cert.
## More information at: http://erlang.org/doc/man/ssl.html
##
## Value: verify_peer | verify_none
## listener.ssl.external.verify = verify_peer

## Used together with {verify, verify_peer} by an SSL server. If set to true,
## the server fails if the client does not have a certificate to send, that is,
## sends an empty certificate.
##
## Value: true | false
## listener.ssl.external.fail_if_no_peer_cert = true

## This is the single most important configuration option of an Erlang SSL
## application. Ciphers (and their ordering) define the way the client and
## server encrypt information over the wire, from the initial Diffie-Helman
## key exchange, the session key encryption ## algorithm and the message
## digest algorithm. Selecting a good cipher suite is critical for the
## application’s data security, confidentiality and performance.
##
## The cipher list above offers:
##
## A good balance between compatibility with older browsers.
## It can get stricter for Machine-To-Machine scenarios.
## Perfect Forward Secrecy.
## No old/insecure encryption and HMAC algorithms
##
## Most of it was copied from Mozilla’s Server Side TLS article
##
## Value: Ciphers
listener.ssl.external.ciphers = ECDHE-ECDSA-AES256-GCM-SHA384,ECDHE-RSA-AES256-GCM-SHA384,ECDHE-ECDSA-AES256-SHA384,ECDHE-RSA-AES256-SHA384,ECDHE-ECDSA-DES-CBC3-SHA,ECDH-ECDSA-AES256-GCM-SHA384,ECDH-RSA-AES256-GCM-SHA384,ECDH-ECDSA-AES256-SHA384,ECDH-RSA-AES256-SHA384,DHE-DSS-AES256-GCM-SHA384,DHE-DSS-AES256-SHA256,AES256-GCM-SHA384,AES256-SHA256,ECDHE-ECDSA-AES128-GCM-SHA256,ECDHE-RSA-AES128-GCM-SHA256,ECDHE-ECDSA-AES128-SHA256,ECDHE-RSA-AES128-SHA256,ECDH-ECDSA-AES128-GCM-SHA256,ECDH-RSA-AES128-GCM-SHA256,ECDH-ECDSA-AES128-SHA256,ECDH-RSA-AES128-SHA256,DHE-DSS-AES128-GCM-SHA256,DHE-DSS-AES128-SHA256,AES128-GCM-SHA256,AES128-SHA256,ECDHE-ECDSA-AES256-SHA,ECDHE-RSA-AES256-SHA,DHE-DSS-AES256-SHA,ECDH-ECDSA-AES256-SHA,ECDH-RSA-AES256-SHA,AES256-SHA,ECDHE-ECDSA-AES128-SHA,ECDHE-RSA-AES128-SHA,DHE-DSS-AES128-SHA,ECDH-ECDSA-AES128-SHA,ECDH-RSA-AES128-SHA,AES128-SHA

## Ciphers for TLS PSK.
## Note that 'listener.ssl.external.ciphers' and 'listener.ssl.external.psk_ciphers' cannot
## be configured at the same time.
## See 'https://tools.ietf.org/html/rfc4279#section-2'.
#listener.ssl.external.psk_ciphers = PSK-AES128-CBC-SHA,PSK-AES256-CBC-SHA,PSK-3DES-EDE-CBC-SHA,PSK-RC4-SHA

## SSL parameter renegotiation is a feature that allows a client and a server
## to renegotiate the parameters of the SSL connection on the fly.
## RFC 5746 defines a more secure way of doing this. By enabling secure renegotiation,
## you drop support for the insecure renegotiation, prone to MitM attacks.
##
## Value: on | off
## listener.ssl.external.secure_renegotiate = off

## A performance optimization setting, it allows clients to reuse
## pre-existing sessions, instead of initializing new ones.
## Read more about it here.
##
## See: http://erlang.org/doc/man/ssl.html
##
## Value: on | off
## listener.ssl.external.reuse_sessions = on

## An important security setting, it forces the cipher to be set based
## on the server-specified order instead of the client-specified order,
## hence enforcing the (usually more properly configured) security
## ordering of the server administrator.
##
## Value: on | off
## listener.ssl.external.honor_cipher_order = on

## Use the CN, DN or CRT field from the client certificate as a username.
## Notice that 'verify' should be set as 'verify_peer'.
##
## Value: cn | dn | crt
## listener.ssl.external.peer_cert_as_username = cn

## TCP backlog for the SSL connection.
##
## See listener.tcp.$name.backlog
##
## Value: Number >= 0
## listener.ssl.external.backlog = 1024

## The TCP send timeout for the SSL connection.
##
## See listener.tcp.$name.send_timeout
##
## Value: Duration
## listener.ssl.external.send_timeout = 15s

## Close the SSL connection if send timeout.
##
## See: listener.tcp.$name.send_timeout_close
##
## Value: on | off
## listener.ssl.external.send_timeout_close = on

## The TCP receive buffer(os kernel) for the SSL connections.
##
## See: listener.tcp.$name.recbuf
##
## Value: Bytes
## listener.ssl.external.recbuf = 4KB

## The TCP send buffer(os kernel) for internal MQTT connections.
##
## See: listener.tcp.$name.sndbuf
##
## Value: Bytes
## listener.ssl.external.sndbuf = 4KB

## The size of the user-level software buffer used by the driver.
##
## See: listener.tcp.$name.buffer
##
## Value: Bytes
## listener.ssl.external.buffer = 4KB

## Sets the 'buffer = max(sndbuf, recbuf)' if this option is enabled.
##
## See: listener.tcp.$name.tune_buffer
##
## Value: on | off
## listener.ssl.external.tune_buffer = off

## The TCP_NODELAY flag for SSL connections.
##
## See: listener.tcp.$name.nodelay
##
## Value: true | false
## listener.ssl.external.nodelay = true

## The SO_REUSEADDR flag for MQTT/SSL Listener.
##
## Value: true | false
listener.ssl.external.reuseaddr = true

##--------------------------------------------------------------------
## External WebSocket listener for MQTT protocol

## listener.ws.$name is the IP address and port that the MQTT/WebSocket
## listener will bind.
##
## Value: IP:Port | Port
##
## Examples: 8083, 127.0.0.1:8083, ::1:8083
listener.ws.external = 8083

## The path of WebSocket MQTT endpoint
##
## Value: URL Path
listener.ws.external.mqtt_path = /mqtt

## The acceptor pool for external MQTT/WebSocket listener.
##
## Value: Number
listener.ws.external.acceptors = 4

## Maximum number of concurrent MQTT/WebSocket connections.
##
## Value: Number
listener.ws.external.max_connections = 102400

## Maximum MQTT/WebSocket connections per second.
##
## Value: Number
listener.ws.external.max_conn_rate = 1000

## Simulate the {active, N} option for the MQTT/WebSocket connections.
##
## Value: Number
listener.ws.external.active_n = 100

## Rate limit for the MQTT/WebSocket connections.
##
## Value: Limit,Duration
## Default: 100KB incoming per 10 seconds.
## listener.ws.external.rate_limit = 100KB,10s

## Zone of the external MQTT/WebSocket listener belonged to.
##
## Value: String
listener.ws.external.zone = external

## The access control for the MQTT/WebSocket listener.
##
## See: listener.ws.$name.access
##
## Value: ACL Rule
listener.ws.external.access.1 = allow all

## Verify if the protocol header is valid. Turn off for WeChat MiniApp.
##
## Value: on | off
listener.ws.external.verify_protocol_header = on

## Use X-Forwarded-For header for real source IP if the EMQ X cluster is
## deployed behind NGINX or HAProxy.
##
## Value: String
## listener.ws.external.proxy_address_header = X-Forwarded-For

## Use X-Forwarded-Port header for real source port if the EMQ X cluster is
## deployed behind NGINX or HAProxy.
##
## Value: String
## listener.ws.external.proxy_port_header = X-Forwarded-Port

## Enable the Proxy Protocol V1/2 if the EMQ cluster is deployed behind
## HAProxy or Nginx.
##
## See: listener.ws.$name.proxy_protocol
##
## Value: on | off
## listener.ws.external.proxy_protocol = on

## Sets the timeout for proxy protocol.
##
## See: listener.ws.$name.proxy_protocol_timeout
##
## Value: Duration
## listener.ws.external.proxy_protocol_timeout = 3s

## The TCP backlog of external MQTT/WebSocket Listener.
##
## See: listener.ws.$name.backlog
##
## Value: Number >= 0
listener.ws.external.backlog = 1024

## The TCP send timeout for external MQTT/WebSocket connections.
##
## See: listener.ws.$name.send_timeout
##
## Value: Duration
listener.ws.external.send_timeout = 15s

## Close the MQTT/WebSocket connection if send timeout.
##
## See: listener.ws.$name.send_timeout_close
##
## Value: on | off
listener.ws.external.send_timeout_close = on

## The TCP receive buffer(os kernel) for external MQTT/WebSocket connections.
##
## See: listener.ws.$name.recbuf
##
## Value: Bytes
## listener.ws.external.recbuf = 2KB

## The TCP send buffer(os kernel) for external MQTT/WebSocket connections.
##
## See: listener.ws.$name.sndbuf
##
## Value: Bytes
## listener.ws.external.sndbuf = 2KB

## The size of the user-level software buffer used by the driver.
##
## See: listener.ws.$name.buffer
##
## Value: Bytes
## listener.ws.external.buffer = 2KB

## Sets the 'buffer = max(sndbuf, recbuf)' if this option is enabled.
##
## See: listener.ws.$name.tune_buffer
##
## Value: on | off
## listener.ws.external.tune_buffer = off

## The TCP_NODELAY flag for external MQTT/WebSocket connections.
##
## See: listener.ws.$name.nodelay
##
## Value: true | false
listener.ws.external.nodelay = true

## The compress flag for external MQTT/WebSocket connections.
##
## If this Value is set true,the websocket message would be compressed
##
## Value: true | false
## listener.ws.external.compress = true

## The level of deflate options for external MQTT/WebSocket connections.
##
## See: listener.ws.$name.deflate_opts.level
##
## Value: none | default | best_compression | best_speed
## listener.ws.external.deflate_opts.level = default

## The mem_level of deflate options for external MQTT/WebSocket connections.
##
## See: listener.ws.$name.deflate_opts.mem_level
##
## Valid range is 1-9
## listener.ws.external.deflate_opts.mem_level = 8

## The strategy of deflate options for external MQTT/WebSocket connections.
##
## See: listener.ws.$name.deflate_opts.strategy
##
## Value: default | filtered | huffman_only | rle
## listener.ws.external.deflate_opts.strategy = default

## The deflate option for external MQTT/WebSocket connections.
##
## See: listener.ws.$name.deflate_opts.server_context_takeover
##
## Value: takeover | no_takeover
## listener.ws.external.deflate_opts.server_context_takeover = takeover

## The deflate option for external MQTT/WebSocket connections.
##
## See: listener.ws.$name.deflate_opts.client_context_takeover
##
## Value: takeover | no_takeover
## listener.ws.external.deflate_opts.client_context_takeover = takeover

## The deflate options for external MQTT/WebSocket connections.
##
## See: listener.ws.$name.deflate_opts.server_max_window_bits
##
## Valid range is 8-15
## listener.ws.external.deflate_opts.server_max_window_bits = 15

## The deflate options for external MQTT/WebSocket connections.
##
## See: listener.ws.$name.deflate_opts.client_max_window_bits
##
## Valid range is 8-15
## listener.ws.external.deflate_opts.client_max_window_bits = 15

## The idle timeout for external MQTT/WebSocket connections.
##
## See: listener.ws.$name.idle_timeout
##
## Value: Duration
## listener.ws.external.idle_timeout = 60s

## The max frame size for external MQTT/WebSocket connections.
##
##
## Value: Number
## listener.ws.external.max_frame_size = 0

##--------------------------------------------------------------------
## External WebSocket/SSL listener for MQTT Protocol

## listener.wss.$name is the IP address and port that the MQTT/WebSocket/SSL
## listener will bind.
##
## Value: IP:Port | Port
##
## Examples: 8084, 127.0.0.1:8084, ::1:8084
listener.wss.external = 8084

## The path of WebSocket MQTT endpoint
##
## Value: URL Path
listener.wss.external.mqtt_path = /mqtt

## The acceptor pool for external MQTT/WebSocket/SSL listener.
##
## Value: Number
listener.wss.external.acceptors = 4

## Maximum number of concurrent MQTT/Webwocket/SSL connections.
##
## Value: Number
listener.wss.external.max_connections = 16

## Maximum MQTT/WebSocket/SSL connections per second.
##
## See: listener.tcp.$name.max_conn_rate
##
## Value: Number
listener.wss.external.max_conn_rate = 1000

## Simulate the {active, N} option for the MQTT/WebSocket/SSL connections.
##
## Value: Number
listener.wss.external.active_n = 100

## Rate limit for the MQTT/WebSocket/SSL connections.
##
## Value: Limit,Duration
## Default: 100KB incoming per 10 seconds.
## listener.wss.external.rate_limit = 100KB,10s

## Zone of the external MQTT/WebSocket/SSL listener belonged to.
##
## Value: String
listener.wss.external.zone = external

## The access control rules for the MQTT/WebSocket/SSL listener.
##
## See: listener.tcp.$name.access.<no>
##
## Value: ACL Rule
listener.wss.external.access.1 = allow all

## See: listener.ws.external.verify_protocol_header
##
## Value: on | off
listener.wss.external.verify_protocol_header = on

## See: listener.ws.external.proxy_address_header
##
## Value: String
## listener.wss.external.proxy_address_header = X-Forwarded-For

## See: listener.ws.external.proxy_port_header
##
## Value: String
## listener.wss.external.proxy_port_header = X-Forwarded-Port

## Enable the Proxy Protocol V1/2 support.
##
## See: listener.tcp.$name.proxy_protocol
##
## Value: on | off
## listener.wss.external.proxy_protocol = on

## Sets the timeout for proxy protocol.
##
## See: listener.tcp.$name.proxy_protocol_timeout
##
## Value: Duration
## listener.wss.external.proxy_protocol_timeout = 3s

## TLS versions only to protect from POODLE attack.
##
## See: listener.ssl.$name.tls_versions
##
## Value: String, seperated by ','
## listener.wss.external.tls_versions = tlsv1.2,tlsv1.1,tlsv1

## Path to the file containing the user's private PEM-encoded key.
##
## See: listener.ssl.$name.keyfile
##
## Value: File
listener.wss.external.keyfile = etc/certs/key.pem

## Path to a file containing the user certificate.
##
## See: listener.ssl.$name.certfile
##
## Value: File
listener.wss.external.certfile = etc/certs/cert.pem

## Path to the file containing PEM-encoded CA certificates.
##
## See: listener.ssl.$name.cacert
##
## Value: File
## listener.wss.external.cacertfile = etc/certs/cacert.pem

## See: listener.ssl.$name.dhfile
##
## Value: File
## listener.ssl.external.dhfile = etc/certs/dh-params.pem

## See: listener.ssl.$name.vefify
##
## Value: vefify_peer | verify_none
## listener.wss.external.verify = verify_peer

## See: listener.ssl.$name.fail_if_no_peer_cert
##
## Value: false | true
## listener.wss.external.fail_if_no_peer_cert = true

## See: listener.ssl.$name.ciphers
##
## Value: Ciphers
listener.wss.external.ciphers = ECDHE-ECDSA-AES256-GCM-SHA384,ECDHE-RSA-AES256-GCM-SHA384,ECDHE-ECDSA-AES256-SHA384,ECDHE-RSA-AES256-SHA384,ECDHE-ECDSA-DES-CBC3-SHA,ECDH-ECDSA-AES256-GCM-SHA384,ECDH-RSA-AES256-GCM-SHA384,ECDH-ECDSA-AES256-SHA384,ECDH-RSA-AES256-SHA384,DHE-DSS-AES256-GCM-SHA384,DHE-DSS-AES256-SHA256,AES256-GCM-SHA384,AES256-SHA256,ECDHE-ECDSA-AES128-GCM-SHA256,ECDHE-RSA-AES128-GCM-SHA256,ECDHE-ECDSA-AES128-SHA256,ECDHE-RSA-AES128-SHA256,ECDH-ECDSA-AES128-GCM-SHA256,ECDH-RSA-AES128-GCM-SHA256,ECDH-ECDSA-AES128-SHA256,ECDH-RSA-AES128-SHA256,DHE-DSS-AES128-GCM-SHA256,DHE-DSS-AES128-SHA256,AES128-GCM-SHA256,AES128-SHA256,ECDHE-ECDSA-AES256-SHA,ECDHE-RSA-AES256-SHA,DHE-DSS-AES256-SHA,ECDH-ECDSA-AES256-SHA,ECDH-RSA-AES256-SHA,AES256-SHA,ECDHE-ECDSA-AES128-SHA,ECDHE-RSA-AES128-SHA,DHE-DSS-AES128-SHA,ECDH-ECDSA-AES128-SHA,ECDH-RSA-AES128-SHA,AES128-SHA

## Ciphers for TLS PSK.
## Note that 'listener.wss.external.ciphers' and 'listener.wss.external.psk_ciphers' cannot
## be configured at the same time.
## See 'https://tools.ietf.org/html/rfc4279#section-2'.
## listener.wss.external.psk_ciphers = PSK-AES128-CBC-SHA,PSK-AES256-CBC-SHA,PSK-3DES-EDE-CBC-SHA,PSK-RC4-SHA

## See: listener.ssl.$name.secure_renegotiate
##
## Value: on | off
## listener.wss.external.secure_renegotiate = off

## See: listener.ssl.$name.reuse_sessions
##
## Value: on | off
## listener.wss.external.reuse_sessions = on

## See: listener.ssl.$name.honor_cipher_order
##
## Value: on | off
## listener.wss.external.honor_cipher_order = on

## See: listener.ssl.$name.peer_cert_as_username
##
## Value: cn | dn | crt
## listener.wss.external.peer_cert_as_username = cn

## TCP backlog for the WebSocket/SSL connection.
##
## See: listener.tcp.$name.backlog
##
## Value: Number >= 0
listener.wss.external.backlog = 1024

## The TCP send timeout for the WebSocket/SSL connection.
##
## See: listener.tcp.$name.send_timeout
##
## Value: Duration
listener.wss.external.send_timeout = 15s

## Close the WebSocket/SSL connection if send timeout.
##
## See: listener.tcp.$name.send_timeout_close
##
## Value: on | off
listener.wss.external.send_timeout_close = on

## The TCP receive buffer(os kernel) for the WebSocket/SSL connections.
##
## See: listener.tcp.$name.recbuf
##
## Value: Bytes
## listener.wss.external.recbuf = 4KB

## The TCP send buffer(os kernel) for the WebSocket/SSL connections.
##
## See: listener.tcp.$name.sndbuf
##
## Value: Bytes
## listener.wss.external.sndbuf = 4KB

## The size of the user-level software buffer used by the driver.
##
## See: listener.tcp.$name.buffer
##
## Value: Bytes
## listener.wss.external.buffer = 4KB

## The TCP_NODELAY flag for WebSocket/SSL connections.
##
## See: listener.tcp.$name.nodelay
##
## Value: true | false
## listener.wss.external.nodelay = true

## The compress flag for external WebSocket/SSL connections.
##
## If this Value is set true,the websocket message would be compressed
##
## Value: true | false
## listener.wss.external.compress = true

## The level of deflate options for external WebSocket/SSL connections.
##
## See: listener.wss.$name.deflate_opts.level
##
## Value: none | default | best_compression | best_speed
## listener.wss.external.deflate_opts.level = default

## The mem_level of deflate options for external WebSocket/SSL connections.
##
## See: listener.wss.$name.deflate_opts.mem_level
##
## Valid range is 1-9
## listener.wss.external.deflate_opts.mem_level = 8

## The strategy of deflate options for external WebSocket/SSL connections.
##
## See: listener.wss.$name.deflate_opts.strategy
##
## Value: default | filtered | huffman_only | rle
## listener.wss.external.deflate_opts.strategy = default

## The deflate option for external WebSocket/SSL connections.
##
## See: listener.wss.$name.deflate_opts.server_context_takeover
##
## Value: takeover | no_takeover
## listener.wss.external.deflate_opts.server_context_takeover = takeover

## The deflate option for external WebSocket/SSL connections.
##
## See: listener.wss.$name.deflate_opts.client_context_takeover
##
## Value: takeover | no_takeover
## listener.wss.external.deflate_opts.client_context_takeover = takeover

## The deflate options for external WebSocket/SSL connections.
##
## See: listener.wss.$name.deflate_opts.server_max_window_bits
##
## Valid range is 8-15
## listener.wss.external.deflate_opts.server_max_window_bits = 15

## The deflate options for external WebSocket/SSL connections.
##
## See: listener.wss.$name.deflate_opts.client_max_window_bits
##
## Valid range is 8-15
## listener.wss.external.deflate_opts.client_max_window_bits = 15

## The idle timeout for external WebSocket/SSL connections.
##
## See: listener.wss.$name.idle_timeout
##
## Value: Duration
## listener.wss.external.idle_timeout = 60s

## The max frame size for external WebSocket/SSL connections.
##
## Value: Number
## listener.wss.external.max_frame_size = 0

##--------------------------------------------------------------------
## Modules
##--------------------------------------------------------------------

##--------------------------------------------------------------------
## Presence Module

## Enable Presence Module.
##
## Value: on | off
module.presence = on

## Sets the QoS for presence MQTT message.
##
## Value: 0 | 1 | 2
module.presence.qos = 1

##--------------------------------------------------------------------
## Subscription Module

## Enable Subscription Module.
##
## Value: on | off
module.subscription = off

## Subscribe the Topics automatically when client connected.
## module.subscription.1.topic = $client/%c
## Qos of the subscription: 0 | 1 | 2
## module.subscription.1.qos = 1

## module.subscription.2.topic = $user/%u
## module.subscription.2.qos = 1

##--------------------------------------------------------------------
## Rewrite Module

## Enable Rewrite Module.
##
## Value: on | off
module.rewrite = off

## {rewrite, Topic, Re, Dest}
## module.rewrite.rule.1 = x/# ^x/y/(.+)$ z/y/$1
## module.rewrite.rule.2 = y/+/z/# ^y/(.+)/z/(.+)$ y/z/$2

##-------------------------------------------------------------------
## Plugins
##-------------------------------------------------------------------

## The etc dir for plugins' config.
##
## Value: Folder
plugins.etc_dir = etc/plugins/

## The file to store loaded plugin names.
##
## Value: File
plugins.loaded_file = data/loaded_plugins

## File to store loaded plugin names.
plugins.expand_plugins_dir = plugins/

##--------------------------------------------------------------------
## Broker
##--------------------------------------------------------------------

## System interval of publishing $SYS messages.
##
## Value: Duration
## Default: 1m, 1 minute
broker.sys_interval = 1m

## System heartbeat interval of publishing following heart beat message:
##  - "$SYS/brokers/<node>/uptime"
##  - "$SYS/brokers/<node>/datetime"
##
## Value: Duration
## Default: 30s
broker.sys_heartbeat = 30s

## Enable global session registry.
##
## Value: on | off
broker.enable_session_registry = on

## Session locking strategy in a cluster.
##
## Value: Enum
## - local
## - one
## - quorum
## - all
broker.session_locking_strategy = quorum

## Dispatch strategy for shared subscription
##
## Value: Enum
## - random
## - round_robin
## - sticky
## - hash
broker.shared_subscription_strategy = random

## Enable/disable shared dispatch acknowledgement for QoS1 and QoS2 messages
## This should allow messages to be dispatched to a different subscriber in
## the group in case the picked (based on shared_subscription_strategy) one # is offline
##
## Value: Enum
## - true
## - false
broker.shared_dispatch_ack_enabled = false

## Enable batch clean for deleted routes.
##
## Value: Flag
broker.route_batch_clean = off

##--------------------------------------------------------------------
## System Monitor
##--------------------------------------------------------------------

## Enable Long GC monitoring. Disable if the value is 0.
## Notice: don't enable the monitor in production for:
## https://github.com/erlang/otp/blob/feb45017da36be78d4c5784d758ede619fa7bfd3/erts/emulator/beam/erl_gc.c#L421
##
## Value: Duration
##  - h: hour
##  - m: minute
##  - s: second
##  - ms: milliseconds
##
## Examples:
##  - 2h:  2 hours
##  - 30m: 30 minutes
##  - 0.1s: 0.1 seconds
##  - 100ms : 100 milliseconds
##
## Default: 0ms
sysmon.long_gc = 0

## Enable Long Schedule(ms) monitoring.
##
## See: http://erlang.org/doc/man/erlang.html#system_monitor-2
##
## Value: Duration
##  - h: hour
##  - m: minute
##  - s: second
##  - ms: milliseconds
##
## Examples:
##  - 2h:  2 hours
##  - 30m: 30 minutes
##  - 0.1s: 0.1 seconds
##  - 100ms: 100 milliseconds
##
## Default: 0ms
sysmon.long_schedule = 240ms

## Enable Large Heap monitoring.
##
## See: http://erlang.org/doc/man/erlang.html#system_monitor-2
##
## Value: bytes
##
## Default: 8M words. 32MB on 32-bit VM, 64MB on 64-bit VM.
sysmon.large_heap = 8MB

## Enable Busy Port monitoring.
##
## See: http://erlang.org/doc/man/erlang.html#system_monitor-2
##
## Value: true | false
sysmon.busy_port = false

## Enable Busy Dist Port monitoring.
##
## See: http://erlang.org/doc/man/erlang.html#system_monitor-2
##
## Value: true | false
sysmon.busy_dist_port = true

## The time interval for the periodic cpu check
##
## Value: Duration
## -h: hour, e.g. '2h' for 2 hours
## -m: minute, e.g. '5m' for 5 minutes
## -s: second, e.g. '30s' for 30 seconds
##
## Default: 60s
os_mon.cpu_check_interval = 60s

## The threshold, as percentage of system cpu, for how much system cpu can be used before the corresponding alarm is set.
##
## Default: 80%
os_mon.cpu_high_watermark = 80%

## The threshold, as percentage of system cpu, for how much system cpu can be used before the corresponding alarm is clear.
##
## Default: 60%
os_mon.cpu_low_watermark = 60%

## The time interval for the periodic memory check
##
## Value: Duration
## -h: hour, e.g. '2h' for 2 hours
## -m: minute, e.g. '5m' for 5 minutes
## -s: second, e.g. '30s' for 30 seconds
##
## Default: 60s
os_mon.mem_check_interval = 60s

## The threshold, as percentage of system memory, for how much system memory can be allocated before the corresponding alarm is set.
##
## Default: 70%
os_mon.sysmem_high_watermark = 70%

## The threshold, as percentage of system memory, for how much system memory can be allocated by one Erlang process before the corresponding alarm is set.
##
## Default: 5%
os_mon.procmem_high_watermark = 5%

## The time interval for the periodic process limit check
##
## Value: Duration
##
## Default: 30s
vm_mon.check_interval = 30s

## The threshold, as percentage of processes, for how many processes can simultaneously exist at the local node before the corresponding alarm is set.
##
## Default: 80%
vm_mon.process_high_watermark = 80%

## The threshold, as percentage of processes, for how many processes can simultaneously exist at the local node before the corresponding alarm is clear.
##
## Default: 60%
vm_mon.process_low_watermark = 60%

