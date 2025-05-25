#include <SystemConfiguration/SystemConfiguration.h>

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
	printf("STUB SCDynamicStoreKeyCreateNetworkGlobalEntity called\n");
	return NULL;
}

CFStringRef SCDynamicStoreKeyCreate(CFAllocatorRef allocator, CFStringRef fmt, ...)
{
	printf("STUB SCDynamicStoreKeyCreate called\n");
	return NULL;
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
	printf("STUB SCDynamicStoreKeyCreateNetworkInterfaceEntity called\n");
	return NULL;
};
