# 제어문

* 기본적으로 위에서 아래로 순차적으로 명령 수행
* 특정 상황에 따라 선택적으로 실행(분기/조건)하거나 반복하는 제어가 필요함

### 조건문

* if문은 참/거짓을 판단할 수 있는 조건식과 함께 사용

* 조건이 참일 경우 실행

* 의외일 경우 else 이후에 들어있는 코드 실행

* else는 필수가 아님

  ```python
  if <expression> :
  	#code
  elif <expression> :
  	#code
  else :
  	#code
  ```

  enumerate 는 반복문에서 각각의 요소를 tuple형식으로 (인덱스, 값)으로 반환한다.

  ```python
  value = num if <조건> else a
  #조건에 따라 value값을 num과 a중에 선택할 때 사용
  ```

### 반복문

* while문

  * 종료 조건에 해당하는 코드를 통해 반복문을 종료시켜야 함(조건이 참인 경우 반복적으로 실행)

    ```python
    while <expression> :
    	#code
    ```

* for 문

  * 시퀀스를 포함한 반복가능(iterable)한 객체를 모두 순회하면 종료(별도의 종료 조건이 필요 없음)

  * 처음부터 끝까지 모두 순회하기 때문에 별도의 종료 조건이 필요하지 않음

    ```python
    for <변수명> in <iterable> :
    	#code
    ```

  * enumerate 함수는 for문에서 iterator에 튜플 형식으로 (인덱스, 값)을 반환해줌

    ```python
    for a,b in enumerate(sequence) :
    	#code
    ```

* 반복 제어

  * break - 반복문 종료
  * continue - 이후의 코드는 생략하고 다음 반복을 수행
  * for-else - 끝까지 실행한 이후 else문 실행 (break로 종료되는 경우 else 생략)

  * pass - 특별히 할일이 없을 떄 자리를 채우는 용도로 사용

  

  