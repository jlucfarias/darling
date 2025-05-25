#include <SystemConfiguration/SystemConfiguration.h>

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
	printf("STUB SCDynamicStoreCreate called\n");
	return NULL;
}
