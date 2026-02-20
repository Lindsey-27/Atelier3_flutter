import 'package:flutter/material.dart';

class  ListePage extends StatefulWidget {
  const ListePage({super.key});

  @override
  State<ListePage> createState() => _ListePageState();

}

class _ListePageState extends State<ListePage>{
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  @override
  Widget build(BuildContext context){
     return SafeArea(
        child: Center(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Ma Liste Prepare",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'ecris ici',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if (_controller.text.isNotEmpty){
                        setState(() {
                          _messages.add(_controller.text);
                          _controller.clear();
                        });
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 13, bottom: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Ajoute une note",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.all(16),
                    padding:  const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView.builder(
                        itemCount: _messages.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsetsGeometry.symmetric(vertical: 4),
                            child: Text(
                              '--* ${_messages[index]}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),
            )

        ),
      );
  }
}
