#ifndef USOCKET_PS3_H
#define USOCKET_PS3_H

/* error codes */
#include <errno.h>

#if PE_PLAT_IS_PSVITA
#else
/* close function */
#include <unistd.h>
/* fnctnl function and associated constants */
#include <fcntl.h>

/* struct sockaddr */
#include <sys/types.h>
/* socket function */
#include <sys/socket.h>
/* struct timeval */
#include <sys/time.h>
/* gethostbyname and gethostbyaddr functions */
#include <netdb.h>

/* sigpipe handling */
//#include <signal.h>
#ifdef SN_TARGET_PS3
#include <sys/select.h>
#endif

/* IP stuff*/
#include <netinet/in.h>
#include <arpa/inet.h>
/* TCP options (nagle algorithm disable) */
#include <netinet/tcp.h>
#endif


typedef int t_socket;
typedef t_socket *p_socket;

#if defined(SN_TARGET_PS3)
	#define socket_h_errno sys_net_h_errno
	#define socket_EAGAIN SYS_NET_EAGAIN
	#define socket_EINTR SYS_NET_EINTR
	#define socket_EINPROGRESS SYS_NET_EINPROGRESS
	#define socket_ECONNABORTED SYS_NET_ERROR_ECONNABORTED
	#define socket_EPIPE SYS_NET_EPIPE
#endif

#define SOCKET_INVALID (-1)

#endif /* USOCKET_PS3_H */
