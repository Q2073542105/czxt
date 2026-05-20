#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>
 
#define SEAT_NUM  2
#define CUSTOMER_NUM  5
 
/************************************/
sem_t empty,full,empty2,full2,mtb,mtw;//mutex lock for the barber and waiting room
int buffer[SEAT_NUM], cur_serv, readpos = 0, writepos = 0;//waiting room
/************************************/
 
void sleep_random(int t) {
  sleep((int)(t * (rand() / (RAND_MAX *1.0))));
}
 
void *barber()
{
  while(5)
  {
/************************************/
    sem_wait(&full);
    buffer[readpos++] = -1;
    if (readpos >= SEAT_NUM){
        readpos = 0;
    }
    sem_post(&empty);
    sem_wait(&empty2);
/************************************/
    printf("barber: start cutting\n");
    sleep_random(3);
    printf("barber: finish cutting\n");
/************************************/
    sem_post(&full2);
/************************************/
  }
}
 
void *customer(void *id)
{
  const int myid = *(int*)id;
  sleep_random(2);
  printf("customer %d: enter waiting-room\n", myid);
 
/************************************/
  sem_wait(&empty);
  sem_wait(&mtw);
/************************************/
  printf("customer %d: sit down\n", myid);
 
/************************************/
  buffer[writepos++] = myid;
  if (writepos >= SEAT_NUM)
      writepos = 0;
  sem_post(&mtw);
  sem_wait(&mtb);
/************************************/
  printf("customer %d: enter cutting-room and sit down\n", myid);
/************************************/
  cur_serv = myid;
  sem_post(&full);
  sem_wait(&full2);
/************************************/
  printf("customer %d: bye\n", myid);
/************************************/
  sem_post(&mtb);
  sem_post(&empty2);
/************************************/
}
 
int main()
{
  int i, id[CUSTOMER_NUM];
  pthread_t t[CUSTOMER_NUM];
 
  srand((int)time(0));
/************************************/
  sem_init(&empty,0,SEAT_NUM);
  sem_init(&full,0,0);
  sem_init(&full2,0,0);
  sem_init(&empty2,0,1);
  sem_init(&mtb,0,1);
  sem_init(&mtw,0,1);
/************************************/
 
  for (i = 0; i < CUSTOMER_NUM; i++)
  {
    id[i] = i + 1;
    pthread_create(&t[i], NULL, customer, &id[i]);
  }
  barber();
  return 0;
}