
import 'package:oop_class_01/member/member.dart';
import 'package:oop_class_01/member/repository/member_repository.dart';

// 메모리에 회원에 대한 데이터를 저장
class MemoryMemberRepositoryImpl implements MemberRepository{

  // 자료구조
  Map<num, Member> memberStore = {};

  // 2. 인스턴스를 저장할 static 변수 선언
  static MemoryMemberRepositoryImpl?_instance;

  // 1. private 생성자를 만들어서 외부에서 호출하지 못하도록 설계한다.
  MemoryMemberRepositoryImpl._internal(); // 네임드 생성자 만들어 보기

  // 3. 외부에서 호출할 수 있는 factory() 생성자를 만들어 준다.
  factory MemoryMemberRepositoryImpl(){
    if(_instance == null){
      _instance = MemoryMemberRepositoryImpl._internal(); // 생성자 호출
    }
    return _instance!;
  }

  @override
  Member? findById(num memberId) {
    return memberStore[memberId];
  }

  @override
  void save(Member member) {
    memberStore[member.id] = member;
  }

}