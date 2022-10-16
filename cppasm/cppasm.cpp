#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
extern "C" char* squeeze(char *source);

int main()
{
    char *source;
    source = new char[200]{};
    gets_s(source, 199);
    char *dest;
    //dest = new char[200]{};
    
    dest = squeeze(source);

    printf("%s\n", dest);
    return 0;
}
