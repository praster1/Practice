/*
챕터 13: 이벤트
우리의 컨트랙트가 거의 완성되어 가는군! 이제 이벤트를 추가해 보세.

이벤트는 자네의 컨트랙트가 블록체인 상에서 자네 앱의 사용자 단에서 무언가 액션이 발생했을 때 의사소통하는 방법이지. 컨트랙트는 특정 이벤트가 일어나는지 "귀를 기울이고" 그 이벤트가 발생하면 행동을 취하지.

예시:

// 이벤트를 선언한다
event IntegersAdded(uint x, uint y, uint result);

function add(uint _x, uint _y) public {
  uint result = _x + _y;
  // 이벤트를 실행하여 앱에게 add 함수가 실행되었음을 알린다:
  IntegersAdded(_x, _y, result);
  return result;
}
그러면 자네 앱의 사용자 단은 해당 이벤트가 일어나는지 귀를 기울이지. 자바스크립트로 이를 구현하면 다음과 같네:

YourContract.IntegersAdded(function(error, result) { 
  // 결과와 관련된 행동을 취한다
}
직접 해보기
좀비가 생성될 때마다 우리 앱의 사용자 단에서 이에 대해 알고, 이를 표시하도록 하는 이벤트가 있으면 좋겠네.

NewZombie라는 event를 선언한다. zombieId (uint형), name (string형), dna (uint형)을 인자로 전달받아야 한다.

_createZombie 함수를 변경하여 새로운 좀비가 zombies 배열에 추가된 후에 NewZombie 이벤트를 실행하도록 한다.

이벤트를 위해 좀비의 id가 필요할 것이다. array.push()는 배열의 새로운 길이를 uint형으로 반환한다. 배열의 첫 원소가 0이라는 인덱스를 갖기 때문에, array.push() - 1은 막 추가된 좀비의 인덱스가 될 것이다. zombies.push() - 1의 결과값을 uint형인 id로 저장하고 이를 다음 줄에서 NewZombie 이벤트를 위해 활용한다.
*/



pragma solidity ^0.4.19;

contract ZombieFactory {

    // 여기에 이벤트 선언
    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string _name, uint _dna) private {
        
        // 여기서 이벤트 실행
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        NewZombie(id, _name, _dna);
    } 

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
