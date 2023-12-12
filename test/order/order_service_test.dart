import 'package:flutter_test/flutter_test.dart';
import 'package:oop_class_01/member/grade.dart';
import 'package:oop_class_01/member/member.dart';
import 'package:oop_class_01/member/repository/member_repository.dart';
import 'package:oop_class_01/member/repository/memory_member_repository_impl.dart';
import 'package:oop_class_01/order/discount_policy.dart';
import 'package:oop_class_01/order/fix_discount_policy.dart';
import 'package:oop_class_01/order/order.dart';
import 'package:oop_class_01/order/percent_discount_policy.dart';
import 'package:oop_class_01/order/service/order_service.dart';
import 'package:oop_class_01/order/service/order_service_impl.dart';

void main(){

  late MemberRepository memberRepository;
  late DiscountPolicy discountPolicy;
  late OrderService orderService;

  // 매번 실행시 마다 초기화 값이 필요 하다면
  // setUp함수 할용가능
  setUp(() {
    memberRepository = MemoryMemberRepositoryImpl();
    discountPolicy = PercentDiscountPolicy();
    discountPolicy = FixDiscountPolicy();
    orderService = OrderServiceImpl(memberRepository, discountPolicy);
  });


  test('주문 테스트 1', () {
    // given
    Member member = Member(id: 100, name: '홍길동', grade: Grade.VIP);
    memberRepository.save(member);

    // when
    // 고정 금액 할인 테스트

    Order order1 = orderService.createOrder(member.id, '맥북', 2000000);
    print(order1.toString());

    // then
    expect(order1.discountPrice, 200000);
    expect(order1.calculateDiscount(), 1800000);
  });

  test('주문 테스트 2', () {
    // given
    Member member = Member(id: 100, name: '홍길동', grade: Grade.VIP);
    memberRepository.save(member);

    // when
    // 고정 금액 할인 테스트

    Order order2 = orderService.createOrder(member.id, '맥북pro', 3000000);
    print(order2.toString());

    // then
    expect(order2.discountPrice, 1500);
    expect(order2.calculateDiscount(), 2998500);

  });
}