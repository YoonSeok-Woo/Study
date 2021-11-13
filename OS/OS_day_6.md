# Semaphore

* 다잌스트라가 제안
* Busy Waiting 문제를 해결



* 음이 아닌 정수형 변수(S)를 활용
  * 초기화 연산, P(), V()로만 접근이 가능하다
  * P: Probern(검사)
  * V: Verhogen(증가)
* 임의의 S 변수 하나에  ready queue하나가 할당됨



### Binary semaphore

* S가 0 과 1 두 종류의 값만 갖는 경우
* 상호 배제나 프로세스 동기화의 목적으로 사용



### Counting semaphore

* S가 0 이상의 정수값을 가질 수 있는 경우
* Producer-Consumer 문제등을 해결하기 위해 사용



### Semaphore 연산

* 초기화 연산

  * S 변수에 초기값을 부여

* P(), V()

  * P()

    ```
    if (S>0)
    	then S <- S-1; (자원이 남아 있다면 자원을 꺼내고)
    	else wait on the queue Q_s; ( 아니면 대기 )
    ```

  * V()

    ```
    if (something waiting processes on Q_s)
    	then wakeup one of them;
    	else S <- S+1;
    ```

* 모두 invisible 연산이다

  * OS support
  * 전체가 한 instruction cycle에 수행된다.

### Semaphore로 해결 가능한 동기화 문제들

* 상호배제
* 프로세스 동기화
  * 프로세스들의 실행 순서 맞추기
    * 프로세스가 점유된 자원이 필요하다면 P 연산을 통해 대기상태로 만든다
    * 점유하고 있던 프로세스가 반납할때 V연산을 통해서 대기중인 프로세스를 깨운다.
* 생산자-소비자
  * 공유 버퍼를 Critical Section이라고 생각한다.
  * consumed, produced 세마포어를 각각 하나씩 만든다
  * 생산자가 생산을 실시할 때 consumed가 1인지 체크 하고 아니라면 P연산을 통해  대기상태로 들어간다 만약 1이라면 P 연산으로 c semaphore를 0으로 바꾸고 생산을 하고 V연산을 통해 p semaphore를 1로 바꿔준다.
  * 소비자는 소비를 하게 될 때 P연산을 통해  P연산을 통해 생산이 되어있지 않다면 대기를, 생산이 되어있다면 p semaphore를 0으로 변경하고, 소비를 한 후 V 연산을 통해 consumed semaphore를 1로 변경해 준다 
* Reader-writer
  * 생산자-소비자와 비슷해보이지만 Reader는 읽기만 수행하기 때문에 여러 Reader가 동시에 접근해도 된다.
  * writer는 하나만 접근해야한다. writer와 reader는 모두 상호배제가 필요하다.
  * writer mutex, reader mutex를 둘다 세마포어로 만든다
  * reader의 숫자를 저장하는 nreaders를 만든다.
  * reader가 요청을 할 경우, reader가 0명일 경우 P연산을 통해 writer mutex를 0으로 바꿔준다.
  * 만약 reader가 이미 있었을 경우( nreaders>0 ) P연산을 생략하고 nreaders를 추가해준다.
  * reader가 나가게 될 경우 nreaders를 먼저 줄이고 줄인 후 nreaders=0일 경우 V연산으로 writer mutex를 1로 변경해주고 나간다.

* Dining philosopher problem
* 기타



### Semaphore의 특징

* No Busy waiting
  * 기다려야 하는 프로세스는 block(asleep)상태가 된다.
* Semaphore queue에 대한 wake-up순서는 비결정적이다.
  * Starvation problem

