# 인터럽트

* 예상치 못한, 외부에서 발생한 이벤트
* 종류
  * I/O interrupt
  * Clock interrupt
  * Console
  * Program check
  * Machine check
  * Inter-process
  * System call





### 인터럽트의 처리 과정

발생 -> 프로세스 중단 -> 인터럽트 처리

​													-> 인터럽트 발생 장소, 원인 파악 -> 인터럽트 여부 결정 -> 루틴 호출



### Context switching

* Context란?

  프로세스와 관련된 정보들의 집합

  * CPU register context =? CPU
  * Code & data, Stack, PCB => memory

* Context saving
  * 현재 프로세스의 Register context를 저장
* Context restoring
  * Register context를 프로세스로 복구하는 작업
* Context switching
  * 실행중인 프로세스의 context를 저장하고, 앞으로 실행 할 프로세스의 context를 복구 하는 일

### Context switching Overhead

* Context switching에 소요되는 비용
  * OS마다 다르며 OS의 성능에 큰 영향을 준다
  * 불필요한 Context switching을 줄이는 것이 매우 중요
    * 예시로 thread 사용이 있다.