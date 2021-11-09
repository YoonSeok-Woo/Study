# 프로세스 관리

### 작업(Job)/프로그램(Program)

* 실행할 프로그램과 데이터
* 시스템에 실행 요청 전의 상태를 의미



### 프로세스(Process)

* 실행을 위해 시스템에 등록된 작업
* 커널에 의해 관리가 된다



### 프로세스의 정의

* 실행중인 프로그램
  * 커널에 등록되고 관리하에 있는 작업
  * 각종 자원들을 요청하고 할당 받을 수 있는 개체
  * 프로세스 관리 블록을 할당 받은 개체
  * 능동적인 개체
* PCB(Process Control Block)
  * 커널 공간 내에 존재
  * 각 프로세스들에 대한 정보를 관리



### 자원의 개념

* 커널의 관리 하에 프로세스에게 할당/반납 되는 수동적 개체
* 자원의 분류
  * H/W resources
  * S/W resources



### 프로세스의 상태(Process States)

* 자원간의 상호작용에 의해 결정

#### Created State

* 작업을 커널에 등록
* PCB할당 및 프로세스 생성
* 커널
  * 가용 메모리 공간 체크 및 프로세스 상태 전이'



#### Ready State

* 프로세서 외에 다른 모든 자원을 할당 받은 상태
  * 프로세서 할당 대기 상태
  * 즉시 실행 가능 상태
* Dispatch(or schedule)
  * Ready State -> running state

* 프로세서 X 기타자원 O 메모리 O

#### Running State

* 프로세서와 필요한 자원을 모두 할당 받은 상태
* Preemption
  * running state-> ready states
  * 프로세스 스케줄링으로 인해 발생
* Block/Asleep
  * running state -> asleep state
  * I/O등 자원 할당 요청
* 프로세서 O 메모리 O



#### Blocked/Asleep State

* 프로세서 외에 다른 자원을 기다리는 상태
  * System call에 의해 자원이 할당된다
* Wake-up
  * Asleep -> ready

* 프로세서 X 기타 자원 X 메모리 O 

#### Suspended State

* 메모리를 할당 받지 못한(빼앗긴) 상태
  * Memory image를 swap device에 보관
  * 커널 또는 사용자에 의해 발생

* Suspended ready - 프로세서 X 메모리 X
* Suspended block - 프로세서 X 기타자원 X 메모리 X

#### Terminated/Zombie State

* 프로세스 수행이 끝난 상태
* 모든 자원을 반납 한 후,
* 커널 내에 일부 PCB정보만 남아 있는 상태
  * 이후 프로세스 관리를 위해 정보를 수집한다.



