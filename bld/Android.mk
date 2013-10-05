DNSMASQ_BLD := $(call my-dir)
LOCAL_PATH := $(DNSMASQ_BLD)/../src

#########################

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  bpf.c cache.c dbus.c dhcp.c dnsmasq.c \
                    forward.c helper.c lease.c log.c \
                    netlink.c network.c option.c rfc1035.c \
		    rfc2131.c tftp.c util.c conntrack.c \
		    dhcp6.c rfc3315.c dhcp-common.c outpacket.c \
		    radv.c slaac.c

LOCAL_MODULE := dnsmasq

LOCAL_C_INCLUDES := $(LOCAL_PATH)

DNSMASQ_VERSION := \"`$(DNSMASQ_BLD)/get-version $(DNSMASQ_BLD)/..`\"
LOCAL_CFLAGS := -O2 -g -W -Wall -DVERSION=$(DNSMASQ_VERSION) -D__ANDROID__ -DNO_IPV6 -DNO_TFTP -DNO_SCRIPT
LOCAL_CPPFLAGS := -DVERSION=$(DNSMASQ_VERSION)
LOCAL_SYSTEM_SHARED_LIBRARIES := libc libcutils

LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog

include $(BUILD_EXECUTABLE)
