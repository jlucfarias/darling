#include <SystemConfiguration/SystemConfiguration.h>

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
	printf("STUB SCDynamicStoreCopyValue called\n");
	return NULL;
}
