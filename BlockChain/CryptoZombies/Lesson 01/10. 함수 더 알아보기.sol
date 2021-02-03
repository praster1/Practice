/*
챕터 10: 함수 더 알아보기
이번 챕터에서는 함수의 반환값과 함수 제어자에 대해서 알아보겠네.

반환값
함수에서 어떤 값을 반환 받으려면 다음과 같이 선언해야 하네:

string greeting = "What's up dog";

function sayHello() public returns (string) {
  return greeting;
}
솔리디티에서 함수 선언은 반환값 종류를 포함하지 (이 경우에는 string이네).

함수 제어자
위의 함수는 솔리디티에서 상태를 변화시키지 않지. 즉, 어떤 값을 변경하거나 무언가를 쓰지 않지.

그러니 이 경우에는 함수를 view 함수로 선언하지. 이는 함수가 데이터를 보기만 하고 변경하지 않는다는 뜻이지:

function sayHello() public view returns (string) {
솔리디티는 pure 함수도 가지고 있는데, 이는 함수가 앱에서 어떤 데이터도 접근하지 않는 것을 의미하지. 다음을 살펴보게:

function _multiply(uint a, uint b) private pure returns (uint) {
  return a * b;
}
이 함수는 앱에서 읽는 것도 하지 않고, 다만 반환값이 함수에 전달된 인자값에 따라서 달라지지. 그러니 이 경우에 함수를 pure로 선언하지.

참고: 함수를 pure나 view로 언제 표시할지 기억하기 어려울 수 있지. 운 좋게도 솔리디티 컴파일러는 어떤 제어자를 써야 하는지 경고 메시지를 통해 잘 알려주네.

직접 해보기
스트링으로부터 랜덤 DNA 숫자를 생성하는 도우미 함수가 필요할 걸세.

_generateRandomDna라는 private 함수를 생성한다. 이 함수는 _str (string형)을 인자로 전달받고, uint을 반환할 것이다.

이 함수는 컨트랙트 변수를 보지만 변경하지는 않을 것이므로 view로 선언한다.

이 함수의 내용은 현재로서는 비어 있는 상태로 둔다. 나중에 채울 것이다.
*/



pragma solidity ^0.4.19;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    }

    // 여기서 시작

    function _generateRandomDna (string _str) private view returns (uint){

    }
}
