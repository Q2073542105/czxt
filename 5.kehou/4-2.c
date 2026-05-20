#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>

#define LIMIT 20
#define M 5
#define N 8

sem_t mtp, mtq, mtr, full1, empty1, empty2, full2;
int buffer1[M], buffer2[N];

void sleep_random(int t) {
    sleep((int)(t * (rand() / (RAND_MAX * 1.0))));
}

void *P() {
    int i;
    for (i = 0; i < LIMIT; i++) {
        sleep_random(2);

        sem_wait(&empty1);
        sem_wait(&mtq);
        sem_wait(&mtp);

        buffer1[i % M] = i + 1;
        printf("P sends:        %d\n", i + 1);

        sem_post(&mtp);
        sem_post(&mtq);
        sem_post(&full1);
    }
    return NULL;
}

void *Q() {
    int i, t;
    for (i = 0; i < LIMIT; i++) {
        sleep_random(2);

        sem_wait(&full1);
        sem_wait(&mtq);
        sem_wait(&mtp);

        t = buffer1[i % M];

        sem_post(&mtp);
        sem_post(&mtq);
        sem_post(&empty1);

        sem_wait(&empty2);
        sem_wait(&mtq);
        sem_wait(&mtr);

        buffer2[i % N] = t;

        sem_post(&mtr);
        sem_post(&mtq);
        sem_post(&full2);
    }
    return NULL;
}

void *R() {
    int i;
    for (i = 0; i < LIMIT; i++) {
        sleep_random(2);

        sem_wait(&full2);
        sem_wait(&mtq);
        sem_wait(&mtr);

        printf("R receives: %d\n", buffer2[i % N]);

        sem_post(&mtr);
        sem_post(&mtq);
        sem_post(&empty2);
    }
    return NULL;
}

int main() {
    int i;
    pthread_t t1, t2;

    for (i = 0; i < M; i++)
        buffer1[i] = -1;
    for (i = 0; i < N; i++)
        buffer2[i] = -1;

    srand((int)time(0));

    sem_init(&mtp, 0, 1);
    sem_init(&mtq, 0, 1);
    sem_init(&mtr, 0, 1);
    sem_init(&full1, 0, 0);
    sem_init(&empty1, 0, M);
    sem_init(&full2, 0, 0);
    sem_init(&empty2, 0, N);

    pthread_create(&t1, NULL, P, NULL);
    pthread_create(&t2, NULL, Q, NULL);
    R();

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    return 0;
}