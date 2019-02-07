#ifndef USOCKET_PSVITA_H
#define USOCKET_PSVITA_H

/* error codes */
#include <errno.h>

#if PE_PLAT_IS_ORBIS
#include <scetypes.h>
#include <libnet/nettypes.h>
#include <libnet/socket.h>
#include <libnet/in.h>
#include <libnet/inet.h>
#include <net.h>
#include <libnet/epoll.h>
#include <libnet/errno.h>

#define socklen_t SceNetSocklen_t
#define sockaddr_in SceNetSockaddrIn
#define in_addr SceNetInAddr
#define linger SceNetLinger
#define u_short SceUShort16
#define ip_mreq SceNetIpMreq

#define AF_INET SCE_NET_AF_INET
#define AF_UNSPEC -1
#define INADDR_ANY SCE_NET_INADDR_ANY

#define SOL_SOCKET SCE_NET_SOL_SOCKET
	#define SO_KEEPALIVE SCE_NET_SO_KEEPALIVE
	#define SO_BROADCAST  SCE_NET_SO_BROADCAST
	#define SO_NBIO SCE_NET_SO_NBIO
	#define SO_REUSEADDR SCE_NET_SO_REUSEADDR

#define TCP_NODELAY SCE_NET_TCP_NODELAY
#define IPPROTO_TCP SCE_NET_IPPROTO_TCP

#define IPPROTO_IP SCE_NET_IPPROTO_IP
#define IP_MULTICAST_LOOP SCE_NET_IP_MULTICAST_LOOP
#define SO_LINGER SCE_NET_SO_LINGER
#define IP_ADD_MEMBERSHIP SCE_NET_IP_ADD_MEMBERSHIP
#define IP_DROP_MEMBERSHIP SCE_NET_IP_DROP_MEMBERSHIP
#define SOCK_STREAM SCE_NET_SOCK_STREAM
#define SOCK_DGRAM SCE_NET_SOCK_DGRAM

#define close sceNetSocketClose

#define bind sceNetBind
#define listen sceNetListen

#define connect sceNetConnect

#define shutdown sceNetShutdown

#define htonl sceNetHtonl
#define htons sceNetHtons
#define ntohs sceNetNtohs

#define send sceNetSend
#define recv sceNetRecv

#define sendto sceNetSendto
#define recvfrom sceNetRecvfrom

#define peusock_accept sceNetAccept
#define setsockopt sceNetSetsockopt
#define getsockopt sceNetGetsockopt
#endif

typedef int t_socket;
typedef t_socket *p_socket;

#if PE_PLAT_IS_ORBIS
	#define peusock_errno sce_net_errno
	#define peusock_EAGAIN SCE_NET_EAGAIN
	#define peusock_EINTR SCE_NET_EINTR
	#define peusock_EINPROGRESS SCE_NET_EINPROGRESS
	#define peusock_ECONNABORTED SCE_NET_ERROR_ECONNABORTED
	#define peusock_EPIPE SCE_NET_EPIPE
#endif

#define SOCKET_INVALID (-1)

#endif /* USOCKET_PSVITA_H */
