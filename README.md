# provider_app

Provider는 Bloc과 비슷하게 앱 전역에 상태를 공유할 수 있습니다. 그러나 그것 외에도
관심사를 분리할 수 있죠.
<br/>

본질적으로 플러터는 UI와 기능이 함께 작성되기 때문에 코드가 쉽게 더러워지고, 분리가 어렵습니다.
Provider의 주요 개념은 자연스럽게 Ui와 상태를 분리해줍니다.
<br/>

Provider: 상태 생산영역 ≈ 상태를 만들고 변화시키는 영역 ≈ BlocProvider, 이벤트로 상태를 변화시키며 최상단의 BlocProvider에서 정해진 Bloc객체를 이용해 이벤트를 보낼 수 있다.
<br/>
Consumer: 상태 소비영역 ≈ 상태변화를 받아 Ui를 다시 빌드하는 영역 ≈ BlocBuilder, Bloc이 보낸 Stream을 통해 변화된 상태를 받는다. 역시 최상단의 BlocProvider에서 정해진 Bloc객체를 이용해 이벤트로 변화된 상태를 받을 수 있다.
<br/><br/>
단! 여기까지만 하면 Provider는 초기 상태를 전달하기만 하지, 블록의 이벤트처럼 상태를 변화시킬 수 없습니다.<br/>
상태의 변화는 ChangeNotifer와 ChangeNotiferProvider를 이용합니다.<br/>

ChangeNotifer의 notifyListeners(): 상태변화를 실시간으로 감지하여 Ui에 전달하는 메소드 ≈ Bloc이 Stream으로 BlocBuilder에게 상태를 전달하는 것<br/>

```
ChangeNotiferProvider(
    create: (context) => Counter()
    child: MaterialApp(...)
)
```
Stream으로 받아온 상태변화를 child 위젯에 Provide합니다.<br/>
여러개의 상태를 관리하고 싶다면
```
MultiProvider(
    providers: [
        ChangeNotiferProvider(create: (context) => State1()),
        Provider(create: (context) => State2())
    ],
    child: MaterialApp(...)
)
```
MultiProvider를 사용합니다.
