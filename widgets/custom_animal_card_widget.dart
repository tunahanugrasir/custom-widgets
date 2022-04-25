import 'package:flutter/material.dart';

class CustomAnimalCardWidget extends StatelessWidget {
  const CustomAnimalCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: _ColorsUtility.white,
        height: MediaQuery.of(context).size.width / 2,
        width: MediaQuery.of(context).size.width / 2,
        child: Column(children: const [
          Expanded(flex: _ExpandedUtiliy.normalFlex, child: AnimalImageCardWidget()),
          Expanded(child: AnimalNameTextWidget(animalName: _TextUtility.cat1)),
          Expanded(child: AnimalSubtitleWidget()),
        ]));
  }
}

class AnimalSubtitleWidget extends StatelessWidget {
  const AnimalSubtitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.location_on_outlined, color: _ColorsUtility.grey),
        Text(
          _TextUtility.subtitle1,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: _ColorsUtility.grey, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

class AnimalNameTextWidget extends StatelessWidget {
  const AnimalNameTextWidget({
    Key? key,
    required this.animalName,
  }) : super(key: key);
  final String animalName;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        animalName,
        style: Theme.of(context).textTheme.headline6?.copyWith(color: _ColorsUtility.black),
      ),
    );
  }
}

class AnimalImageCardWidget extends StatelessWidget {
  const AnimalImageCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: _PaddingUtility.normalPadding,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(_ImageAdress.catImage1, fit: BoxFit.cover),
              ),
              Positioned(
                  top: 5,
                  left: -10,
                  child: SizedBox(
                      height: _SizedBoxUtility.pawHeight,
                      width: _SizedBoxUtility.pawWidth,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Image.network(_ImageAdress.catPawImage,
                            fit: BoxFit.cover, color: _ColorsUtility.white),
                      ))),
              Positioned(
                  bottom: -10,
                  left: 110,
                  child: SizedBox(
                    height: _SizedBoxUtility.pawHeight,
                    width: _SizedBoxUtility.pawWidth,
                    child: Image.network(_ImageAdress.catPawImage,
                        fit: BoxFit.cover, color: _ColorsUtility.white),
                  )),
            ],
          ),
        ));
  }
}

class _ImageAdress {
  static const String catImage1 = 'https://i.pinimg.com/originals/8c/ab/4e/8cab4e46f19b1c4ae0ed8ff6c5115e7d.jpg';
  static const String catPawImage =
      'https://png2.cleanpng.com/sh/32f45dcd58dca8d11bd1457600ee552b/L0KzQYm3U8MyN5x5j5H0aYP2gLBuTfRwb15oeeY2cHH6PcH5if51cZ9sRdV1aYCwccP7TgBif146edRvMHO8R4K5gfM1Pl88UKY9NUi0RoK8UsI1P2E1S6s5N0a4PsH1h5==/kisspng-dog-cat-paw-printing-clip-art-paw-5abf0c9712ac46.7844581615224700390765.png';
}

class _ExpandedUtiliy {
  static const int normalFlex = 3;
}

class _SizedBoxUtility {
  static const double pawHeight = 50;
  static const double pawWidth = 50;
}

class _ColorsUtility {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
}

class _TextUtility {
  static const String cat1 = 'Kelebek Rıfkı';
  static const String subtitle1 = '1km uzaklıkta';
}

class _PaddingUtility{
  static const EdgeInsets normalPadding = EdgeInsets.symmetric(horizontal: 20,vertical: 10);
}