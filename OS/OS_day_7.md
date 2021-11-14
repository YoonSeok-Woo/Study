# Eventcount/Sequencer

세마포어에서 깨울때 아무거나 깨워서 특정 프로세스가 너무 오래 기다리는것을 방지하기 위해 순서를 정해주는 방법



### Sequencer

* 정수형 변수
* 생성시 0으로 초기화
* 발생 사건들의 순서를 유지한다.
* ticket(S)연산으로만 접근이 가능하다



##### ticket(S)

* 현재까지 ticket() 연산이 호출된 횟수를 반환한다.



### Eventcount

* 정수형 변수
* 생성시 0으로 초기화, 감소하지 않는다
* 특정 사건의 발생 횟수를 기록한다.
* read(E), advance(E), await(E,v)연산으로만 접근 가능



##### read(E)

* 현재 Eventcount 값 반환

##### advance(E)

* E <- E+1
* E를 기다리고 있는 프로세스를 깨움 (wake-up)

##### await(E,v)

* V는 정수형 변수
* if(E<v) 이면 E에 연결된 Q_E에 프로세스 전달(push) 및 CPU scheduler 호출



### Producer Consumer problem

* P ticket, C ticket : sequencer
* In, Out : eventcount
* buffer: array[N] of message

##### 생산자 

1. t<-ticket(P ticket) , await(In)로 세마포의 P연산과 유사한 기능을 한다.
2. await(Out, t-N+1), buffer[t mod N] <-M 은 Critical section
3. advance(In)은 V

##### 소비자

1. u<- ticket(C ticket), await(out,u)로 마찬가지로 P연산
2. await(In, u+1), m<-buffer[u mod N] 은 Critical Section
3. advance(Out)은 V

* 생산자에서 총 공간은 N개 ticket에서 Out 을 빼주면 실제 현재 점유 중인 공간 갯수가 된다.
* 따라서 N-t+Out >=1 이라면 현재 공간이 남아 있다는 뜻이므로 Out >= t-N+1이면 공간이 있는 것이고 반대로 Out < t-N+1이라면 공간이 없다는 것이기 때문에 await를 통해 대기상태로 돌릴 때 await(Out, t -N+1)로 Critical Section을 만들어 준다.
* 컨슈머에서 물건이 있는지 확인해야 한다.
* 물건 수가 1보다 크다면 컨슈머가 자원을 점유할 수 있다.
* 물건 수는 In의 갯수에서 총 사용횟수 u를 뺀 숫자이다.
* 즉 In-u >= 1 이면 자원을 점유할 순서라는 뜻 반대로 In< u+1이라면 소비할 물건이 없다는 뜻이다.
* 그래서 await(In, u+1)로 Critical Section을 만든다.



### 특징

* No busy waiting
* No starvation 
  * FIFO scheduling for Q_E
* Semaphore 보다 더 low-level control이 가능하다.