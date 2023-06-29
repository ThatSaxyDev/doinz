part of 'web_view.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: Pallete.brownColor,
      child: Stack(
        children: [
          Positioned.fill(
            top: -50,
            child: Center(
              child: Text(
                'iteoluwaKIISI\nFLUTTER dev',
                textAlign: TextAlign.center,
                style: GoogleFonts.biryani(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OverlayTextSection extends StatelessWidget {
  const OverlayTextSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: const Stack(
        children: [
          _TitleText(
            text: 'ALWAYS',
            top: 100,
            left: 50,
          ),
          _TitleText(
            text: 'STAY',
            top: 260,
            left: 290,
          ),
          _TitleText(
            text: '+VE',
            top: 420,
            left: 220,
          ),
          Positioned(
            right: 50,
            top: 600,
            child: SizedBox(
              width: 470,
              child: Text(
                overlayDescriptionText,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  final double? top;
  final double? left;
  final String text;
  const _TitleText({
    Key? key,
    required this.text,
    this.top,
    this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        child: Text(
          text,
          style: GoogleFonts.fascinate(
              fontSize: 200, fontWeight: FontWeight.w900, color: Colors.white),
        ));
  }
}
