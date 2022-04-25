import 'package:flutter/material.dart';

class AddAccountModalBottom extends StatelessWidget {
  final Widget widget;
  const AddAccountModalBottom({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - 50,
        minHeight: MediaQuery.of(context).size.height - 50,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: const [
              Align(
                alignment: Alignment.topLeft,
                child: BackButton(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Criar conta',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: widget,
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height - 500),
            child: FloatingActionButton(
              child: const Icon(Icons.check),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
