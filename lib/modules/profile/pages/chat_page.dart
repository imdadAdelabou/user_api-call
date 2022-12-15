import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loviser/providers/page/message_page/message_page_provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../providers/page/message_page/user.dart';
import '../../../utils/handle_string.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.received_user}) : super(key: key);

  final User received_user;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController _controller = TextEditingController();
  ScrollController controller = new ScrollController();
  ItemScrollController itemScrollController = new ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  late bool isFirstTimeNavigateToPage = true;
  late bool isTop = true;
  late bool isNotTop = false;
  late bool isLoading = false;
  /*
  List messages = [
    {
      "text": 'Hello',
      "isMe": false,
      "createdAt": '2:30 PM',
    },
    {
      "text": 'How are you?',
      "isMe": true,
      "createdAt": '2:31 PM',
    },
    {
      "text": 'ok, cool 😀',
      "isMe": false,
      "createdAt": '2:32 PM',
    },
    {
      "text": 'Hello',
      "isMe": false,
      "createdAt": '2:30 PM',
    },
    {
      "text": 'How are you?',
      "isMe": true,
      "createdAt": '2:31 PM',
    },
    {
      "text": 'ok, cool 😀',
      "isMe": false,
      "createdAt": '2:32 PM',
    },
    {
      "text": 'Hello',
      "isMe": false,
      "createdAt": '2:30 PM',
    },
    {
      "text": 'How are you?',
      "isMe": true,
      "createdAt": '2:31 PM',
    },
    {
      "text": 'ok, cool 😀',
      "isMe": false,
      "createdAt": '2:32 PM',
    },
    {
      "text": 'ok, cool 😀',
      "isMe": false,
      "createdAt": '2:32 PM',
    },
    {
      "text": 'Hello',
      "isMe": false,
      "createdAt": '2:30 PM',
    },
    {
      "text": 'How are you?',
      "isMe": true,
      "createdAt": '2:31 PM',
    },
    {
      "text": 'ok, cool 😀',
      "isMe": false,
      "createdAt": '2:32 PM',
    },
    {
      "text": 'ok, cool 😀',
      "isMe": false,
      "createdAt": '2:32 PM',
    },
    {
      "text": 'Hello',
      "isMe": false,
      "createdAt": '2:30 PM',
    },
    {
      "text": 'How are you?',
      "isMe": true,
      "createdAt": '2:31 PM',
    },
    {
      "text": 'ok, cool 😀',
      "isMe": false,
      "createdAt": '2:32 PM',
    },
  ];
  */

/*
  void getMoreMessage() {
    messages.removeAt(0);

    for (int i = 0; i < 15; i++)
      messages.insert(0, {
        "text": 'ok, cool 😀',
        "isMe": false,
        "createdAt": '2:32 PM',
      });

    setState(() {});
  }
  */

  Future jumbToLastedMessage(int postion) async {
    itemScrollController.jumpTo(index: postion);

    // await item
  }

  @override
  void didChangeDependencies() {
    print("Chat Page : didChangeDependencies");

    /*
    Provider.of<MessagePageProvider>(context)
        .fetchAndSetMessages(widget.received_user.chatID)
        .then((_) {});
    */

    if (isFirstTimeNavigateToPage) {
      Provider.of<MessagePageProvider>(context).init_Chat_Page();
      Provider.of<MessagePageProvider>(context)
          .fetchAndSetMessages(widget.received_user.chatID)
          .then((_) {});
      isFirstTimeNavigateToPage = false;
    }

    // check top or bottom of message view

    itemPositionsListener.itemPositions.addListener(() {
      print("isNotTop : $isNotTop");
      print("isTop : $isTop");
      final indices = itemPositionsListener.itemPositions.value
          .where((item) {
            final isTopVisible = item.itemLeadingEdge >= 0;
            final isBottomVisible = item.itemTrailingEdge <= 1;

            return isTopVisible && isBottomVisible;
          })
          .map((item) => item.index)
          .toList();

      if (indices.contains(0) == false) {
        isNotTop = true;
      }

      isTop = indices.contains(0);

      if (isNotTop == true && isTop == true // if go down and go up to top
          ) {
        setState(() {
          isLoading = true;
        });

        Provider.of<MessagePageProvider>(context, listen: false)
            .fetchAndSetMessages(widget.received_user.chatID)
            .then((_) {
          setState(() {
            isLoading = false;
          });
        });

        isNotTop = false;
      }

      print('List current message on screen : $indices');
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // check top or bottom of message view

    /*
    itemPositionsListener.itemPositions.addListener(() {
      final indices = itemPositionsListener.itemPositions.value
          .where((item) {
            final isTopVisible = item.itemLeadingEdge >= 0;
            final isBottomVisible = item.itemTrailingEdge <= 1;

            return isTopVisible && isBottomVisible;
          })
          .map((item) => item.index)
          .toList();

      if (indices.contains(0)) {
        print("Chat page on top : Need load more messages");
        getMoreMessage();
      }
      print('List current message on screen : $indices');
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    //print('Chat page rebuild');
    final messages = Provider.of<MessagePageProvider>(context, listen: true)
        .getMessagesForChatID_json(widget.received_user.chatID);

    /*
    messages.insert(
      0,
      {
        "text": '',
        "isMe": true,
        "createdAt": '',
      },
    );
    */

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1657299170222-1c67dc056b70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  HandleString.validateForLongStringWithLim(
                    widget.received_user.name,
                    10,
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              color: Color(0xFF229D1F),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.video_call_sharp,
              color: Color(0xFF229D1F),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20,
        ),
        child: ScrollablePositionedList.builder(
          initialScrollIndex: messages.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            //print('Index Chat message: $index ${messages.length}');

            if (index == 0 && isLoading) {
              return CupertinoActivityIndicator();
            }

            return messages[index]["isMe"]
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 250),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xff1972F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        messages[index]["text"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                : Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1657299170222-1c67dc056b70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60'),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 250),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 231, 236),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          messages[index]["text"],
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
          ),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xFFE8EAF3),
              ),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xFFE8FDF2),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(12),
                child: const Text(
                  'Bắt đầu tư vấn',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0E9D57),
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Viết tin nhắn',
                  ),
                ),
              ),
              IconButton(
                splashRadius: 20,
                icon: const Icon(
                  Icons.send,
                  color: Colors.blue,
                ),
                onPressed: () {
                  setState(() {
                    /*
                    messages.add({
                      "isMe": true,
                      "text": _controller.text,
                    });
                    */

                    Provider.of<MessagePageProvider>(context, listen: false)
                        .sendMessage(
                            _controller.text, widget.received_user.chatID);

                    _controller.text = "";
                  });

                  itemScrollController.jumpTo(index: messages.length);
                  //jumbToLastedMessage(messages.length);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
