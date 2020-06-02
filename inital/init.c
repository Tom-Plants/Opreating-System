#include "../header/common/core.h"

BOOTABLE    //This is BOOTABLE FILE with '0xAA55' flag

QCHAR message[] = "Hello World!";
QVOID boot_main()
{
    //bootloader main
    //int len = strlen(message);
    *(char *)0xA0000 = 'a';
    //*(char *)0xB8000 = 'a';
    
    return;
}
QUINT strlen(char *string)
{
    unsigned int len = 0;
    unsigned int i;
    for(i = 0; i < 64; i++)
    {
        if(*(string + i) == '\0')
        {
            break;
        }
        len++;
    }
    return len;
}