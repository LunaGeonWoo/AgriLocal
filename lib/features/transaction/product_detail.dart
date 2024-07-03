import 'package:agrilocal/features/product/product_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key});

  final product = ProductDetail(
    name: '김치볶음밥',
    imageUrl:
        'https://roout.co.kr/m/p/u/vHf969g/c/tsLVxjn3JeU/i/tmaNCLUJoFS.jpg?w=720',
    price: 8000,
    producer: "김농부",
    location: "천안 불당동",
    description: """🍅아삭한 유럽종 완숙토마토 3kg🍅
안녕하세요! 산 좋고 물 좋은 청정골 전남 화순 건강하고 맛있는 토마토를 재배하고 있는 대박토마토입니다!

나무에서 잘 익혀 수확해서 완전한 완숙토마토를 맛 보실 수 있습니다!
창고에서 익힌 토마토와 현저히 다른 완숙토마토의 맛을 즐겨보세요!
저희토마톤믄 아삭한 식감으로 요리용으로 으뜸인 토마토 입니다😉
또한 저장성이 우수해 오래 두고 드실 수 있어요!!

❤️사이즈는 대/중/소 랜덤으로 나갑니다!
❤️배송중에 약간의 흠이 날 수 있습니다!
❤️당일 수확한 토마토만 보내드립니다.
❤️수확 당일 배송출발을 원칙으로 합니다.
❤️오후 3시 까지 주문건에 대하여 당일 발송 합니다.

👉🏻토마토 보관 방법👈🏻
토마토는 꼭지를 떼고 씻어서 물기를 말리거나 닦아서 키친타올 하나 깔고 통에 보관해주시면 아주 오래갑니다! 저장성이 우수한 품종이라 이렇게 보관만 하시면 3주도 넘게 보관 가능합니다!
상처난 토마토가 혹시 있다면 먼저 먹어주시되 상처 났다고 쉽게 상하지는 않으니 너무 염려하지는 마세요!

📌꼭 읽어주세요
정말 좋은 품질에 토마토인데, 배송 중에 약간의 흠집이 생길 수 있어요!(물론 토마토가 깨지는 등의 배송사고는 당연히 처리 해드립니다!)
여름철이라 저번 보다는 아주 조금 덜 익혀서 나갈 수도 있어요! 토마토 붉은 상태 보시고 전체가 다 붉게 된 건 바로 꼭지 떼고 냉장보관🧊 조금 주황빛이라면 하루정도 상온에서 후숙하고 꼭지 떼고 냉장고에 넣으시면 됩니다!

⁉️택배 사고가 났다면⁉️
 배송중 파손 등의 이슈가 있다면 택배 상자에 송장이 붙어있는 모습을 그대로  반드시 잘 찍어서 보내주세요!""",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // IconButton(
            //   onPressed: () {},
            //   icon: const FaIcon(FontAwesomeIcons.house),
            // ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.flag),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        product.producer,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(product.location),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                product.description,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Text(
              '${product.price}원',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("채팅하기"),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("구매하기"),
            )
          ],
        ),
      ),
    );
  }
}
