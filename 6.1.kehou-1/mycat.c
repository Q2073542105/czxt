#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
 
#define MSG_LEN 80
#define FILE_FROM "/usr/root/hello.c"
 
int main()
{
  int fd, num;
  char msg[MSG_LEN+1];
 
  /* welcome */
  printf("\n\rHi, press ENTER to continue...\n\r");
  read(0, msg, 1);
 
  /* open and read the file */
  if ((fd=open(FILE_FROM,O_RDONLY,0)) < 0) {
    printf("Open file error.\n\r");
    return 1;
  }
  if ((num = read(fd, msg, MSG_LEN))<0) {
    printf("Read file error.\n\r");
    return 1;
  }
  close(fd);
 
  /* display on screen */
  msg[num] = '\0';
  printf("Content of file \"%s\":\n\r---\n\r%s---\n\r", FILE_FROM, msg);
 
  return 0;
}