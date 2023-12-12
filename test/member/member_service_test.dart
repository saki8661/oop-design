import 'package:flutter_test/flutter_test.dart';
import 'package:oop_class_01/member/grade.dart';
import 'package:oop_class_01/member/member.dart';
import 'package:oop_class_01/member/repository/member_repository.dart';
import 'package:oop_class_01/member/repository/memory_member_repository_impl.dart';
import 'package:oop_class_01/member/service/member_service.dart';
import 'package:oop_class_01/member/service/member_service_impl.dart';

void main(){

  test('회원가입 서비스 테스트1', () {

    // given
    MemberRepository memberRepository = MemoryMemberRepositoryImpl();
    MemberService memberService = MemberServiceImpl(memberRepository);
    Member newMember = Member(id: 1, name: '홍길동', grade: Grade.BASIC);

    // when
    memberService.signUp(newMember);

    // then


  });

}