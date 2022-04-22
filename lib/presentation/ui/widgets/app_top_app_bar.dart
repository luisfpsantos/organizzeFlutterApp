import 'package:flutter/material.dart';

class AppTopAppBar extends StatelessWidget {
  const AppTopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: Padding(
        padding: const EdgeInsets.only(top: 60, right: 16, left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  color: Colors.white,
                  padding: const EdgeInsets.all(0),
                  iconSize: 75,
                  icon: const Icon(
                    Icons.account_circle_outlined,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      DateTime.now().hour <= 18 ? 'Bom Dia' : 'Boa Noite',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(186, 255, 255, 255),
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${'Luis Fernando'.split(' ')[0]}!',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 17,
                ),
                IconButton(
                  color: Colors.white,
                  iconSize: 30,
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
