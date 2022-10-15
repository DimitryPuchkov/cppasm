#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
extern "C" void squeeze(char *source, char *dest);

int main()
{
    char *source;
    source = new char[200]{};
    scanf("%s", source);
    char *dest;
    dest = new char[200]{};
    
    squeeze(source, dest);

    printf("%s\n", dest);
    return 0;
}
