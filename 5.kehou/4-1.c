#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>
 
#define N  8
#define PRODUCT_NUM 15
int buffer[N], readpos = 0, writepos = 0;
sem_t full, empty, mutexC, mutexP; //添加生产者和消费者的mutex
void sleep_random(int t) {
  sleep((int)(t * (rand() / (RAND_MAX *1.0))));
}
#define PRODUCER_CNT 5
#define CONSUMER_CNT 5
void *produce(void *idx){
    int id =*((int*)idx); //创建线程的id
    int i;
    for (i = 0; i < PRODUCT_NUM; i++){
        sleep_random(2);
        sem_wait(&empty);
        sem_wait(&mutexP); 
        sem_wait(&mutexC);
        buffer[writepos++] = 1000*(id) + i + 1;
        if (writepos >= N)
            writepos = 0;
        printf("produce:    %d\n", 1000*(id) + i + 1);
        sem_post(&mutexC);
        sem_post(&mutexP);
        sem_post(&full);
    }
}
 
void *consume(){
    int i;
    for (i = 0; i < PRODUCT_NUM; i++){
        sleep_random(2);
        sem_wait(&full);
        sem_wait(&mutexP);
        printf("consume: %d\n", buffer[readpos]);
        buffer[readpos++] =  - 1;
        if (readpos >= N)
            readpos = 0;
        sem_post(&mutexP);
        sem_post(&empty);
    }
}
 
int main(){
    int res, i;
    pthread_t t1[PRODUCER_CNT],t2[CONSUMER_CNT];
    for (i = 0; i < N; i++)
        buffer[i] =  - 1;
    srand((int)time(0));
    sem_init(&full, 0, 0);
    sem_init(&empty, 0, N);
    sem_init(&mutexP, 0, 1);
    sem_init(&mutexC, 0, 1);
    for (i = 0; i < PRODUCER_CNT; i++)
	    res = pthread_create(&t1[i], NULL, produce, &i);
    if (res != 0){
        perror("failed to create thread");
        exit(1);
    }
    for (i = 0; i < CONSUMER_CNT; i++)
	    res = pthread_create(&t2[i], NULL, consume, NULL);
    if (res != 0){
        perror("failed to create thread");
        exit(1);
    }
    void* resj;
    for(i = 0; i < PRODUCER_CNT; i++){
        pthread_join(t1[i],&resj);
    }
    for(i = 0; i < CONSUMER_CNT; i++){
        pthread_join(t2[i],&resj); 
    }
    return 0;
}