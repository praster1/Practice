/*
챕터 5: 구조체
자네가 좀 더 복잡한 자료형을 필요로 할 때가 가끔 있을 거네. 이를 위해 솔리디티는 구조체를 제공하지:

struct Person {
  uint age;
  string name;
}
구조체를 통해 여러 특성을 가진, 보다 복잡한 자료형을 생성할 수 있지.

참고로 string이라는 새로운 자료형을 방금 소개했네. 스트링은 임의의 길이를 가진 UTF-8 데이터를 위해 활용되네. 이를테면 string greeting = "Hello world!" 이렇게 말이지.

직접 해보기
우리 앱에서 좀비 몇 마리를 생성하기를 원할 것이네! 좀비들이 다양한 특성을 가질 것이니 구조체를 활용하기에 안성맞춤이군.

Zombie라는 struct를 생성한다.

우리의 Zombie 구조체는 name (string형)과 dna (uint형)이라는 2가지 특성을 가진다.
*/



pragma solidity ^0.4.19;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    // 여기서 시작
    struct Zombie {
        string name;
        uint dna;
    }
}
