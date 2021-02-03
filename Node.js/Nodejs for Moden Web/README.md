# 모던 웹을 위한 Node.js 프로그래밍 3판

## Chpater 1. Nodejs 개요

스레드

장점
- 사용자에 대한 응답성을 향상시켜야 할 때
- 동시에 작업을 완료시켜야 할 때

사용해야 하는 경우
- 네트워크 웹 서버 또는 데이터베이스 통신
- 시간이 오래 걸리는 작업

단점
- 많은 스레드 코드 실행을 제어하면 복잡해지고 버그가 발생할 수 있음.
- 스레드를 삭제하려면 삭제할 때 발생할 수 있는 문제와 처리 방법을 알아야 함.

Nodejs는 스레드의 단점을 해결하고자 내부적으로는(개발자가 몰라도 되는 부분) 스레드를 사용하고 외부적으로는 스레드를 사용하지 않는 방식으로 개발되었습니다.

### 1.1 Node.js 배경사

Nodejs는 서버 환경에서 동작하는 자바스크립트.

v8엔진 -> 빠른 속도.

이벤트 기반 비동기 방식 네트워크 입출력.

### 1.2 이벤트 기반 비동기 방식

대규모 네트워크 앱 개발에 적합함.

### 1.3 Node.js의 장단점

장점
- 이벤트 기반 비동기 방식을 사용하므로 대규모 네트워크 앱을 개발하기에 적합하다.
- 자바스크립트를 사용한다. (어떤 웹 개발자도 자바스크립트를 사용하므로 쉽게 접근이 가능하다)
- 구글이 만든 자바스크립트 엔진을 사용한다.(v8엔진) - 구글이 무너지지 않는 한 계속 빨라진다.
- c++로 개발된 v8 엔진으로 개발되어, c++을 사용해 기능을 확장할 수 있습니다.

단점
- 앱 실행에 문제가 발생하는 순간 앱 전체가 영향을 받는다.
- 자바스크립트를 사용하는게 단점일 수도 있다. (아무리 빨라도 c++로 개발된 서버보다는 느리다)

### 1.4 Node.js의 활용

- 이베이 : Node.js를 사용해 웹 api를 배포.
- 링크드인 : 자사의 모든 서버를 Node.js를 사용해 구성.
- 야머 : 프락시 서버를 Node.js로 개발.
- 페이팔
- 트위터
- 많은 스타트업
- GitHub에서 만든 atom 에디터도 Node.js로 만듬

## Chpater 2. Node.js 개발 환경 구축

꼭 알아둘 개념

| 개념| 설명 |
|----|------|
| LTS 버전 | Long Time Support의 약자로 30개월의 장기적인 지원을 약속받은 버전이라는 의미입니다. |
| Current 버전 | 어떠한 변화가 일어나고 있는 상태의 버전입니다. 조금은 안정적이지 않습니다. |
| REFL | Read Eval Print Loop이라고 부르며 한 줄씩 코드를 입력해 실행해볼 수 있는 공간입니다. |
| node 파일이름 | 파일 형태의 Node.js 앱을 실행하는 기본 명령입니다. |

### 2.1 LTS 버전과 Current 버전

현재 Node.js의 웹사이트([https://nodejs.org/](https://nodejs.org/))에 들어가면 6.x, 7.x를 다운로드할 수 있게 되어 있습니다.

현재 기준으로 버전을 다음과 같이 구분합니다.
- 6.x : LTS
- 7.x : Current

### 2.1.1 Current 버전

어떠한 변화가 일어나고 있는 상태의 버전 조금은 안정적이지 않을 수 있다.

Node.js는 6개월 단위로 버전 숫자를 하나 올립니다. 따라서 6개월 마다 새로운 current 버전이 나옵니다.

### 2.1.2 LTS 버전

짝수 버전을 가진 Current 버전은 6개월이 지나면 LTS 버전으로 바뀜.

LTS는 30개월의 장기적인 지원을 약속받은 버전. LTS 버전은 숫자가 오른다고 해도 호환성을 깨뜨리는 변경 사항이 추가되지 않는다.

따라서 실무에서는 LTS 버전을 사용하자.

### 2.5 첫 번째 Node.js 애플리케이션

## Chapter3. Node.js의 전역 객체

| 개념 | 설명 |
|-----|-------|
| 전역 변수/객체 | 프로그램 전체에 사용할 수 있는 변수와 객체를 의미합니다. |
| process 객체 | 프로그램과 관련된 정보를 나타내는 객채며, 웹 브라우저에서 작동하는 자바스크립트에 존재하지 않는 Node.js만이 가진 객체입니다. |
| 모듈 | 모듈은 기능을 쉽게 사용하고자 메서드와 속성을 미리 정의해 모아 놓은 것입니다. |
| exports 객체 | 모듈을 생성할 때 사용합니다. |

### 3.1 전역 변수

웹 브라우저에서 동작하는 자바스크립트 최상위 객체는 window 객체입니다.

하지만 Node.js는 웹 브라우저에서 동작하는 것이 아니므로 window 객체가 없습니다.

대신 전역변수와 전역함수를 가지고 있습니다.

[문자열 자료형의 전역 변수]

| 변수 이름 | 설명 |
|-----|-------|
| __filename | 현재 실행 중인 코드의 파일 경로를 나타냅니다. |
| __dirname | 현재 실행 중인 코드의 폴더 경로를 나타냅니다. |

[전역객체]

| 객체 이름 | 설명 |
|-----|-------|
| console | 콘솔 화면과 관련된 기능을 다루는 객체입니다. |
| exports | 모듈과 관련된 기능을 다루는 객체입니다. |
| process | 프로그램과 관련된 기능을 다루는 객체입니다. |

### 3.2 console 객체

콘솔 화면과 관련된 기능을 다루는 객체

| 메서드 이름 | 설명 |
|-----|-------|
| log() | 출력합니다. |
| time() | 시간 측정을 시작합니다. |
| timeEnd() | 시간 측정을 종료합니다. |

### 3.3 process 객체

프로그램과 관련된 정보를 나나내는 객체.

웹 브라우저에서 작동하는 자바스크립트에 존재하지 않는 Node.js만이 가진 객체입니다.

[속성]

| 속성 이름 | 설명 |
|----------|------|
| argv | 실행 매개변수를 나타냅니다. |
| env | 컴퓨터 환경과 관련된 정보를 나타냅니다. |
| version | Node.js 버전을 나타냅니다. |
| versions | Node.js와 종송된 프로그램 버전을 나타냅니다. |
| arch | 프로세서와 아키텍쳐를 나타냅니다. |
| platform | 플랫폼을 나타냅니다. |

[메서드]

|메서드 이름 | 설명 |
|-----------|------|
| exit([exitCode = 0]) | 프로그램을 종료합니다. |
| memoryUsage() | 메모리 사용 정보 객체를 리턴합니다. |
| uptime() | 현재 프로그램이 실행된 시간을 리턴합니다. |

### 3.4 exports 객체와 모듈

Node.js는 모듈을 사용해 기능을 확장합니다.

모듈은 기능을 쉽게 사용하고자 메서드와 속성을 미리 정의해 모아 놓은 것입니다.

모듈을 생성할 때는 exports 객체를 사용합니다.

## Chapter4. 기본 내장 모듈

| 개념 | 설명 |
|-----|------|
| Node.js 문서 | Node.js의 주요 기능을 설명하는 문서입니다. https://nodejs.org/dist/latest-v버전숫자.x/docs/api/에 접속하면 가장 최신 버전의 문서를 확인할 수 있습니다. |
| url 모듈 | 인터넷 주소를 다루는 데 사용합니다. |
| Query String 모듈 | URL 객체의 쿼리를 다루는 데 사용합니다. |
| util 모듈 | Node.js의 보조 기능을 모아두었습니다. |
| crypto 모듈 | 해시 생성과 암호화를 수행합니다. |
| File System 모듈 | 파일을 다루는 데 사용합니다. |

Node.js 문서

[https://nodejs.org/dist/latest-v6.x/docs/api/](https://nodejs.org/dist/latest-v6.x/docs/api/)

### 4.1 os 모듈

[https://nodejs.org/dist/latest-v6.x/docs/api/os.html](https://nodejs.org/dist/latest-v6.x/docs/api/os.html)

os 모듈은 앱을 만들때 많이 활용되지는 않습니다.

| 메서드 이름 | 설명 |
|-----|------|
| hostname() | 운영체제의 호스트 이름을 리턴합니다. |
| type() | 운영체제의 이름을 리턴합니다. |
| platform() | 운영체제의 플랫폼을 리턴합니다. |
| arch() | 운영체제의 아키텍쳐를 리턴합니다. |
| release() | 운영체제의 버전을 리턴합니다. |
| uptime() | 운영체제가 실행된 시간을 리턴합니다. |
| loadavg() | 로드 에버리지 정보를 담은 배열을 리턴합니다. |
| totalmem() | 시스템의 총 메모리를 리턴합니다. |
| freemem() | 시스템의 사용 가능한 메모리를 리턴합니다. |
| cpus() | cpu의 정보를 담은 객체를 리턴합니다. |
| networkInterfaces() | 네트워크 인터페이스의 정보를 담은 배열을 리턴합니다. |

### 4.2 url 모듈

[https://nodejs.org/dist/latest-v6.x/docs/api/url.html](https://nodejs.org/dist/latest-v6.x/docs/api/url.html)

| 메서드 이름 | 설명 |
|------------|------|
| parse(urlStr[, parseQueryString=false<BR>[, slashesDenoteHost=false]]) | URL 문자열을 URL 객체로 변환해 리턴합니다. |
| format(urlObj) | URL 객체를 URL 문자열로 변환해 리턴합니다. |
| resolve(from, to) | 매개변수를 조합해 완전한 URL 문자열을 생성해 리턴합니다. |

### 4.3 Query String 모듈

[https://nodejs.org/dist/latest-v6.x/docs/api/querystring.html](https://nodejs.org/dist/latest-v6.x/docs/api/querystring.html)

Query String 모듈은 URL 객체의 쿼리와 관련된 모듈입니다.

| 메서드 이름 | 설명 |
|------------|------|
| stringify(obj[, sep[, eq[, options]]]) | 쿼리 객체를 쿼리 문자열로 변환해 리턴합니다. |
| parse(str[, sep[, eq[, options]]]) | 쿼리 문자열을 쿼리 객체로 변환해 리턴합니다. |

query string 모듈은 유용하지만 url 모듈에 기능이 통합되어 많이 사용되지 않는 것 같습니다.

url.parse 메서드의 두번째 매개변수를 사용하면 querystring.parse와 같은 효과를 얻을 수 있습니다.

### 4.4 util 모듈

[https://nodejs.org/dist/latest-v6.x/docs/api/util.html](https://nodejs.org/dist/latest-v6.x/docs/api/util.html)

util 모듈은 node.js의 보조적인 기능을 모아둔 모듈입니다.

| 메서드 이름 | 설명 |
|------------|------|
| format(format[, ...args]) | 매개변수로 입력한 문자열을 조합해 리턴합니다. |

format 메서드는 console.log와 비슷하지만 출력하지 않고 문자열을 반환합니다.

### 4.5 crypto 모듈

[https://nodejs.org/dist/latest-v6.x/docs/api/crypto.html](https://nodejs.org/dist/latest-v6.x/docs/api/crypto.html)

crypto 모듈은 해시[^1] 생성과 암호화를 수행하는 모듈입니다.

> 해시
> 일반적으로 프로그래밍 언어에서 해시라는 말이 나오면 2가지 의미로 사용됩니다.
> 1. 키와 값을 갖는 자료형 : 대표적으로 자바스크립트의 객체가 해시입니다.
> 2. 전자 지문 : 지금부터 살펴보는 내용입니다.

여기서 말하는 해시는 암호화된 문자입니다.

> 원본 문자열이 조금이라도 다르면 해시 상태가 굉장히 많이 달라집니다. 이를 눈사태 효과라고도 부릅니다.

해시는 다른 문자열이라도 같게 나올 수도 있습니다. 따라서 해시를 원래 값으로 돌리는 것은 완전히 불가능합니다.

예를들어

웹사이트에 가입하면 서버는 사용자의 비밀번호를 해시화해서 저장합니다.

따라서 서버에는 사용자의 원본 비밀번호는 남지 않습니다. 

그리고 사용자가 로그인 하면 비밀번호를 해시화해서 비교합니다.

원래 비밀번호는 어떠한 장소에도 저장하지 않으므로 비밀번호를 해킹당해도 로그인할 수 없습니다.

해커가 해시화된 암호를 직접 입력해도 해당 문자열을 다시 한번 해시화해서 비교하므로 로그인이 불가능 합니다.

### 4.6 File System 모듈

[https://nodejs.org/dist/latest-v6.x/docs/api/fs.html](https://nodejs.org/dist/latest-v6.x/docs/api/fs.html)

| 메서드 이름 | 설명 |
|------------|------|
| readFile(file, encoding, callback) | 파일을 비동기적으로 읽습니다. |
| readFileSyhnc(file, encoding) | 파일을 동기적으로 읽습니다. |
| writeFile(file, data, encoding, callback) | 파일을 비동기적으로 씁니다. |
| writeFileSync(file, encoding) | 파일을 동기적으로 씁니다. |

### 불 자료형 변환

```
console.log(Boolean(0));
console.log(Boolean(NaN));
console.log(Boolean(''));
console.log(Boolean(null));
console.log(Boolean(undefined));
```

위 5가지는 모드 false를 리턴합니다.

단 console.log(Boolean('0'))과 console.log(Boolean('false'))는 빈 문자열이 아니므로 true를 출력합니다.

### 조기 리턴

오류 처리 부분을 오류만 출력하고 끝내는 간단한 코드로 구성한다면, 조기 리턴을 사용해서 코드를 깔끔하게 만들 수 있습니다.

```
// 모듈을 추출합니다.
var fs = require('fs');

// 파일을 읽습니다.
fs.readFile('textfile.txt', 'utf8', function(error, data) {
    if (error) { return console.log(error); }
    
    // 원하는 처리
    console.log(data);    
});

// 파일을 씁니다.
fs.writeFile('textfile.txt', 'Hello World .. !', function(error) {
    if (error) { return console.log(error); }
    
    // 원하는 처리
    console.log('FILE WRITE COMPLETE');
});
```

이전의 코드와 다르게 오류가 발생하면 곧바로 리턴하게 만들었습니다.

이를 조기 리턴이라고 부릅니다. 원하는 처리에 else 구문을 따로 사용할 필요가 없으므로 코드의 들여쓰기 단계가 줄어듭니다.

Node.js로 프로그램을 만들 때는 코드의 들여쓰기가 굉장히 많아지므로, 하나라도 줄일 수 있다면 줄이는 것이 좋답니다.

## Chapter5. 이벤트

| 개념 | 설명 |
|-----|-------|
| on() | 이벤트를 연결하는 메서드입니다. |
| emit() | 이벤트를 실행할 때 사용합니다. |
| EventEmitter 객체 | 이벤트를 연결할 수 있는 모든 객체의 어머니입니다. |

### 5.1 이벤트 연결

| 개념 | 설명 |
|-----|-------|
| on(eventName, eventHandler) | 이벤트를 연결합니다. |

### 5.2 이벤트 연결 개수 제한

Node.js는 한 이벤트에 10개가 넘는 이벤트 리스너를 연결할 경우 이를 개발자의 실수로 간주합니다.

하지만 10개 이상의 이벤트를 등록하고 싶을 때가 있습니다. 경고를 제거하려면 아래와 같이 하십시오.

| 메서드 이름 | 설명 |
|-----|-------|
| setMaxListeners(limit) | 이벤트 리스너 연결 개수를 조절합니다. |

### 5.3 이벤트 제거

| 메서드 이름 | 설명 |
|-----|-------|
| removeListener(eventName, handler) | 특정 이벤트의 이벤트 리스너를 제거합니다. |
| removeAllListener(eventName) | 모든 이벤트 리스너를 제거합니다. |

이벤트를 한 번만 연결하고 싶은 경우 아래와 같이 사용해도 됩니다.

| 메서드 이름 | 설명 |
|-----|-------|
| once(eventName, eventHandler) | 이벤트 리스너를 한 번만 연결합니다. |

### 5.4 이벤트 강제 발생

이벤트를 강제로 발생시킬 때는 아래와 같이 합니다.

| 메서드 이름 | 설명 |
|-----|-------|
| emit(eventName[, arg1][, arg2][, ...]) | 이벤트를 실행합니다. |

### 5.5 이벤트 생성

Node.js에서 이벤트를 연결할 수 있는 모든 객체는 EventEmitter 객체의 상속을 받습니다.

process 객체도 EventEmitter 객체의 상속을 받기 때문에 이벤트를 연결할 수 있는 것입니다.

아래는 EventEmitter 객체의 메서드입니다.

| 메서드 이름 | 설명 |
|-----|-------|
| addListener(eventName, eventHandler) | 이벤트를 연결합니다. |
| on(eventName, eventHandler) | 이벤트를 연결합니다. |
| setMaxListeners(limit) | 이벤트 연결 개수를 조절합니다. |
| removeListener(eventName, handler) | 특정 이벤트의 이벤트 리스너를 제거합니다. |
| removeAllListener(eventName) | 모든 이벤트 리스너를 제거합니다. |
| once(eventName, eventHandler) | 이벤트 리스너를 한 번만 연결합니다. |

## Chapter6. http 모듈

http 모듈은 node.js의 가장 기본적인 웹 모듈입니다.

| 개념 | 설명 |
|-----|-------|
| 요청 | 웹 페이지에 접속하려고 하는 어떤 요청을 말합니다. |
| 응답 | 요청을 받아 이를 처리하는 작업을 말합니다. |
| http 모듈 | http 웹 서버와 관련된 모든 기능을 담은 모듈입니다. |
| server 객체 | 웹 서버를 생성하는 데 꼭 필요한 객체입니다. |
| response 객체 | 응답 메시지를 작성할 때 request 이벤트 리스너의 두 번째 매개변수로 전달되는 객체입니다. |
| request 객체 | 응답 메시지를 작성할 때 request 이벤트 리스너의 첫 번째 매개변수로 전달되는 객체입니다. |

### 6.1 요청과 응답

웹 서버가 하는 일은 요청과 응답의 연속이라고 정의할 수 있습니다.

요청하는 대상을 클라이언트(사용자)라고 부릅니다.

응답하는 대상을 서버(제공자)라고 부릅니다.

웹은 클라이언트가 서버에게 HTML 페이지나 파일을 요청하면 서버가 그 요청에 응답해 요청한 HTML 문서 또는 파일을 클라이언트에 제공하는 장소입니다.

클라이언트와 서버는 편지를 주고받는 것처럼 요청과 응답을 처리합니다.

> 스트림 : 프로그램이 프로그램 외부와 통신할 때는 컴퓨터 속에 흐르는 물길이라고 비유할 수 있는 스트림을 사용합니다. 예를 들어 키보드 입력이 프로그램 안으로 들어갈 때는 표준 입력 스트림을 사용합니다. 마찬가지로 웹에서 데이터가 전송될 때도 스트림을 이용합니다.

### 6.2 server 객체

http 모듈에서 가장 중요한 객체는 server 객체입니다.

http 모듈의 createServer() 메서드를 사용하면 server 객체를 생성할 수 있습니다.

| 메서드 이름 | 설명 |
|-----|-------|
| listen(port[, callback]) | 서버를 실행합니다. |
| close([callback]) | 서버를 종료합니다. |

> 포트는 컴퓨터와 컴퓨터를 연결하는 정보의 출입구 역할을 하는 곳입니다. 컴퓨터에는 0번부터 65535번까지 포트가 있습니다.

server 객체에서 중요한 것은 메서드보다 이벤트 입니다.

server 객체는 EventEmitter 객체를 기반으로 만들어졌으므로 이벤트를 연결할 수 있습니다.

| 이벤트 이름 | 설명 |
|-----|-------|
| request | 클라이언트가 요청할 때 발생하는 이벤트입니다. |
| connection | 클라이언트가 접속할 때 발생하는 이벤트입니다. |
| close | 서버가 종료될 때 발생하는 이벤트입니다. |
| checkContinue | 클라이언트가 지속적인 연결을 하고 있을 때 발생하는 이벤트입니다. |
| upgrade | 클라이언트가 http 업그레이드를 요청할 때 발생하는 이벤트입니다. |
| clientError | 클라이언트에서 오류가 발생할 때 발생하는 이벤트입니다. |

server 객체의 이벤트 중 request 이벤트 리스너는 별도로 on() 메서드를 사용해 지정할 필요 없이
createServer() 메서드의 매개변수로 입력할 수 있습니다.

```
require('http').createServer(function (request, response) {
    response.writeHead(200, { 'Content-Type': 'text/html' });
    response.end('<h1>Hello World .. !</h1>');
}).listen(52273);
```

### 6.3 response 객체

클라이언트에 웹 페이지를 제공하려면 응답 메시지를 작성해야 합니다.

응답 메시지를 작성할 때는 request 이벤트 리스너의 두 번째 매개변수로 전달되는 response 객체를 사용합니다.

| 메서드 이름 | 설명 |
|-----|-------|
| writeHead(statusCode[, statusMessage][, headers]) | 응답 헤더를 작성합니다. |
| end([data][, encoding][, callback]) | 응답 본문을 작성합니다. |