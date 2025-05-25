#include <SystemConfiguration/SystemConfiguration.h>

CFStringRef SCDynamicStoreKeyCreateComputerName(CFAllocatorRef allocator)
{
	printf("STUB SCDynamicStoreKeyCreateComputerName called\n");
	return NULL;
};

Boolean SCPreferencesSetComputerName(SCPreferencesRef prefs, CFStringRef __nullable name, CFStringEncoding nameEncoding)
{
	printf("STUB SCPreferencesSetComputerName called\n");
	return FALSE;
};

Boolean SCPreferencesSetLocalHostName(SCPreferencesRef prefs, CFStringRef __nullable name)
{
	printf("STUB SCPreferencesSetLocalHostName called\n");
	return FALSE;
};

CFStringRef SCDynamicStoreKeyCreateHostNames(CFAllocatorRef allocator)
{
	printf("STUB SCDynamicStoreKeyCreateHostNames called\n");
	return NULL;
};
