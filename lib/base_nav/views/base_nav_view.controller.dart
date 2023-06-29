part of 'base_nav_view.dart';

//! the state notifier provider for controlling the state of the base nav wrapper
final baseNavControllerProvider =
    StateNotifierProvider<BaseNavController, int>((ref) {
  return BaseNavController();
});

//! the state notifier class for controlling the state of the base nav wrapper
class BaseNavController extends StateNotifier<int> {
  BaseNavController() : super(0);

  //! move to page
  void moveToPage({required int index}) {
    state = index;
  }
}

//! () => move to page
void moveToPage({
  required BuildContext context,
  required WidgetRef ref,
  required int index,
}) {
  ref.read(baseNavControllerProvider.notifier).moveToPage(index: index);
}

//! List of pages
List<Widget> pages = const [
  CounterView(),
  WebView(),
];

//! nav widget enums
enum Nav {
  counter(PhosphorIcons.plusMinusBold),
  web(PhosphorIcons.scrollBold);

  const Nav(
    this.selectedIcon,
  );
  final IconData selectedIcon;
}

List<Nav> nav = [
  Nav.counter,
  Nav.web,
];
