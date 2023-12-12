import 'package:oop_class_01/member/member.dart';
import 'package:oop_class_01/member/repository/member_repository.dart';
import 'package:oop_class_01/order/discount_policy.dart';
import 'package:oop_class_01/order/order.dart';
import 'package:oop_class_01/order/service/order_service.dart';

class OrderServiceImpl implements OrderService{

  // DIP
  MemberRepository memberRepository;
  DiscountPolicy discountPolicy;

  // 생성자 의존 --> DI
  OrderServiceImpl(this.memberRepository, this.discountPolicy);

  @override
  Order createOrder(num memberId, String itemName, int itemPrice) {
    // 1. 회원 아이디를 찾아서 회원 등급을 확인한다.
    // 2. 회원 등급에 해당하는 할인 정책을 반영한다.
    Member? memberEntity = memberRepository.findById(memberId);
    // 회원 없다면 예외처리 -> 생략
    // ! null 억제 연산자 - memberEntity 녀석은 절대 null 이 아니다 강제!
    int discountPrice = discountPolicy.discount(memberEntity!, itemPrice);

    return Order(memberId: memberId, itemName: itemName, itemPrice: itemPrice, discountPrice: discountPrice);
  }

}